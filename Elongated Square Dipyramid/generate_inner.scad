// Auto-generated OpenSCAD file

    inner_points = 10*[[0.5429769689115526, -0.4529635870924383, 0.49999999999997413], [0.5429769689115337, -0.4529635870924037, -0.500000000000026], [-0.4529635870924116, -0.5429769689115604, 0.49999999999998984], [-0.4529635870924304, -0.5429769689115258, -0.5000000000000102], [0.4529635870924304, 0.5429769689115258, 0.5000000000000102], [0.4529635870924116, 0.5429769689115604, -0.49999999999998984], [-0.5429769689115337, 0.4529635870924037, 0.500000000000026], [-0.5429769689115526, 0.4529635870924383, -0.49999999999997413], [2.2755059616728634e-14, -4.168991678798836e-14, 1.2071067811865475], [-2.2755059616728634e-14, 4.168991678798836e-14, -1.2071067811865475]];

    outer_points = 10*[[-0.039354312458118546, -0.43916949600833827, 0.7453733238228553], [0.04209249648260477, 0.5541932458770876, 0.6641521421813528], [0.6640328188038629, -0.5541932458770876, 0.04393474451517876], [0.7454796277445863, 0.43916949600833827, -0.03728643712632368], [-0.7454796277445863, -0.43916949600833827, 0.03728643712632368], [-0.6640328188038629, 0.5541932458770876, -0.04393474451517876], [-0.04209249648260477, -0.5541932458770876, -0.6641521421813528], [0.039354312458118546, 0.43916949600833827, -0.7453733238228553], [-0.09831499537835225, -1.1990949019079598, 0.09804263913544194], [0.09831499537835225, 1.1990949019079598, -0.09804263913544194]];

    // Convex hull for inner set (I)
    module inner_hull() {
        hull() {
            for (p = inner_points) {
                translate(p) sphere(r=0.1);
            }
        }
    }

    // Convex hull for outer set (O) minus inner hull (O \ I)
    module outer_minus_inner() {
        difference() {
            hull() {
                for (p = outer_points) {
                    translate(p) sphere(r=0.1);
                }
            }
            inner_hull(); // Subtract inner hull
        }
    }

    // Convex hull for outer set (O) minus all translated inner hulls
    module outer_minus_AllTranslationInner() {
        difference() {
            hull() {
                for (p = outer_points) {
                    translate(p) sphere(r=0.1);
                }
            }
            hull() {
                translate([0,0,50]) inner_hull();
                translate([0,0,-50]) inner_hull();
            }; // Subtract translated inner hulls
        }
    }

    // Difference between outer_minus_inner and outer_minus_AllTranslationInner
    module outer_minus_inner_diff() {
        difference() {
            // Outer minus inner
            difference() {
                hull() {
                    for (p = outer_points) {
                        translate(p) sphere(r=0.1);
                    }
                }
                inner_hull();
            }

            // Subtract Outer minus AllTranslationInner
            difference() {
                hull() {
                    for (p = outer_points) {
                        translate(p) sphere(r=0.1);
                    }
                }
                hull() {
                    translate([0,0,50]) inner_hull();
                    translate([0,0,-50]) inner_hull();
                };
            }
        }
    }

    // Rendering all with colors applied
    color([1, 0, 0, 0.5]) inner_hull(); // Transparent red
    