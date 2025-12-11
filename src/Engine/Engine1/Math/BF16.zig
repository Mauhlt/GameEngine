const std = @import("std");

const BF16 = @This();

// 1/8/7 IEEE-754 format
// Made for higher throughput, high dynamic range, smaller precision

bits: u16,

pub fn initRaw(v: u16) BF16 {
    return .{ .bits = v };
}

// sign: 0 or 1
// exp: 0..255 (unbiased exp + 127 for normal ieee)
// frac: 0..(1<<7)-1 (7-bit mantissa)
// combine (sign, exp, frac) into single 16 bit unsigned integer
pub fn initParts(sign: u1, exp: u8, frac: u7) BF16 {
    const s: u16 = @as(u16, sign) << 15;
    const e: u16 = (@as(u16, exp) & 0xFF) << 7;
    const f: u16 = @as(u16, frac);
    return .{ .bits = s | e | f };
}

pub fn toF64(self: BF16) f64 {
    const sign: u1 = @intCast(self.bits >> 15);
    const exp_b: u9 = @intCast((self.bits >> 7) & 0xFF);
    const frac: u7 = @intCast(self.bits & 0x7F);

    if (exp_b == 0 and frac == 0) {
        return if (sign == 1) -0.0 else 0.0;
    }
    if (exp_b == 0xFF) {
        // Inf / NaN
        if (frac == 0) {
            return if (sign == 1) -std.math.inf(f64) else std.math.inf(f64);
        } else {
            return std.math.nan(f64);
        }
    }

    // bias = 127; IEEE-754 Single
    const bias: i32 = 127;
    const e: i32 = @as(i32, @intCast(exp_b)) - bias;

    const mant: f64 = 1.0 + @as(f64, @floatFromInt(frac)) / 128.0;
    var v: f64 = mant * std.math.pow(f64, 2.0, @as(f64, @floatFromInt(e)));
    if (sign == 1) v = -v;
    return v;
}

pub fn fromF64(x: f64) BF16 {
    if (std.math.isNan(x)) return BF16.initRaw(0x7FC0);
    if (x == std.math.inf(f64)) return BF16.initRaw(0x7F80);
    if (x == -std.math.inf(f64)) return BF16.initRaw(0xFF80);
    if (x == 0.0) return if (std.math.signbit(x)) BF16.initRaw(0x8000) else BF16.initRaw(0x0000);

    const neg = x < 0.0;
    var ax = if (neg) -x else x;

    var e: i32 = 0;
    {
        const lg = std.math.log2(ax);
        e = @intFromFloat(std.math.floor(lg));
        ax = ax / std.math.pow(f64, 2.0, @as(f64, @floatFromInt(e)));
    }

    // ax in [1, 2) so mantissa m in [0,1)
    const m = ax - 1.0;

    // quantize mantissa to 7 bits with round to nearest even
    const mf = m * 128.0; // 2^7
    const floor_mf = std.math.floor(mf);
    const frac_mf = mf - floor_mf;

    var mant_int: u32 = @intFromFloat(floor_mf);
    if (frac_mf > 0.5 or (frac_mf == 0.5 and (mant_int & 1) == 1)) {
        mant_int += 1;
    }

    if (mant_int == 128) {
        // rounded overflows mantissa; norm
        mant_int = 0;
        e += 1;
    }

    const bias: i32 = 127;
    const exp_b = e + bias;

    if (exp_b <= 0) {
        // underflow to zero or subnormals (flush to 0 here)
        return if (neg) BF16.initRaw(0x8000) else BF16.initRaw(0x0000);
    } else if (exp_b >= 0xFF) {
        // overflow to inf
        return if (neg) BF16.initRaw(0xFF80) else BF16.initRaw(0x7F80);
    }

    const sign_bit: u1 = if (neg) 1 else 0;
    return BF16.initparts(sign_bit, @intCast(exp_b), @intCast(mant_int));
}

test "BF16 Roundtrip Basic" {
    const x: f64 = 1.5;
    const b = BF16.fromF64(x);
    const y = b.toF64();
    std.debug.print("1.5 -> {x} -> {y}\n", .{ b.bits, y });
}
