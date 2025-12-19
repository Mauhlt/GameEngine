# Navier-Stokes-Einstein Equations
nabla * u = 0, velocities cannot flow towards or away each other, mass is conserved in the fluid
p Du/Dt = -nablap + mu nabla^2 u + pF
acceleration of fluid = internal force + external force = (pressure gradient + viscocity) + external forces
pressure = flows from high to low
viscocity = friction in movement of fluid = moves slower when higher
external forces = walls, gravity, wind
defines specification not implementation = must follow these rules but not how to follow them

Types of Simulations
1. Particles
2. Grid

Level Of Detail:
1. Regular = Uses more memory but can be faster for smaller sims
2. Dynamic = Saves memory but can be faster for larger sims

Real-Time Fluid Simulation For Games - Jos Stam - 2003
- simple fluid solver
- mountain creator = may also work for fluid simulations - try that out too
