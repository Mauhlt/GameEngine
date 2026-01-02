# Gilbert-Johnson-Keerthi Algorithm
https://www.youtube.com/watch?v=ajv46BSqcK4&t=88s
- types of shapes:
    - convex = 2 points on shape, line between them is on shape
        - easier to work with
    - concave = 2 points on shape intersect line between them
        - can break shapes into convex shapes
- what is an intersection?
    - when 1 point is shared by both objects
    - when difference of 2 points, 1 for each object, is the origin (0, 0, 0)
- Minkowski Sum / Difference
    - take difference in points between two objects = new set of points = minkowski sum
    - same as sweeping 1 shape over another
    - offsets from origin do matter
- Minkowski Difference = Minkowski Sum but negate all points of 1 shape
- Properties:
    - Minkowski Difference of 2 convex shapes = a new convex shape
    - if two shapes intersect, then difference overlaps the origin
- What are support points?
    1. pick n points where n forms a simplex for that dimension
        - 2D: simplex = triangle = 3 points
        - 3D: simplex = tetrahedron = 4 points
        - which point to pick?
            - pick the furthest points in those directions (only works for convex shapes)
        - support function = fn that maps a direction to point furthest along it
            - select support point along that direction
            - select support point along opp direction for other shape
            - subtract the 2 points
            - sb(d) = v = argmax v in ste B vTd = point v that maximizes dot product with direction d
            - each geometry has its own way of computing support points
- Steps:
    1. pick random direction
    2. next pick towards origin - check if we ended past origin - otherwise diff does not contain origin
    3. pick normal direction to vector facing origin
    4. pick perpendicular vector towards origin - if it does not pass origin = no
- How do we tell if we passed the origin?
    - dot product: A * d < 0 = no
    - can this be sped up using signs?
    - can this be sped up using trig? 
    - can this be sped up using exp?
- How do we find the next direction, given 2 points?
    - use normal of the line towards the origin
    - 2 vectors: AO and AB
    - cross product = orthogonal to AB and AO = AB x AO
    - cross product of (AB x AO) x AB
        - another perpendicular vector pointing towards origin
        - called vector triple product
- How do we check that our triangle contains the origin?
    - create ABC triangle where A is the latest chosen vertex 
    - create perpendiculare lines to ends of each edge = defines voronoi regions
    - which regions do we never have to check?
        - we used minkowski diff + picked points furthest along a direction = can't be any of basic regions
            - remove Rc, Rb, Ra 
        - point A = result of moving in direction normal to BC that is furthest along direction towards origin
            - remove Rbc (opp direction)
        - 2 possible regions: Rab, Rac
        - check Regions Rab and Rac:
            - find normal to AB: use triple product: ABperp = (AC x AB) x AB
            - if dot(AB, AO) > 0, then it contains the origin
            - repeat for region Rac
        - check origin is in triangle
            - if both region checks above fail, triangle must contain origin
- How do we pick a new direction if triangle doesn't contain origin?
