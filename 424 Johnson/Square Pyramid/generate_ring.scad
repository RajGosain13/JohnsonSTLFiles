// Auto-generated OpenSCAD file

    inner_points = 10*[[0.499999999647243, -0.10355339109877267, -0.5000000000000022], [-0.5000000003527529, -0.10355339028132902, 0.5000000000000022], [-0.5000000003527572, -0.10355339028132601, -0.49999999999999795], [0.4999999996472473, -0.10355339109877568, 0.49999999999999795], [2.2526713020467915e-10, 0.6035533904964967, 2.128597539314253e-15]];

    outer_points = 10*[[0.7071067811865476, 0.0, -2.669135025276785e-09], [-0.7071067811865476, 0.0, 2.669135025276785e-09], [-2.6278612663574398e-14, 0.7071067811522772, -6.961725442369196e-06], [2.6278612663574398e-14, -0.7071067811522772, 6.961725442369196e-06], [2.6691350251474237e-09, 6.961725442369196e-06, 0.7071067811522772]];

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
    color([0, 1, 0, 1]) outer_minus_AllTranslationInner(); // Opaque green
    