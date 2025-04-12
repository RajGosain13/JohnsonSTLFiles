// Auto-generated OpenSCAD file

    inner_points = 10*[[0.06319597715687762, 0.1268463153899368, 1.0], [-0.2699443063437531, 0.9262320492567245, 0.5000000000006233], [0.691291687541074, -0.08050791918503769, -0.750000000000228], [-0.2317594497271782, -0.4651851838989617, -0.7500000000003951], [0.6912916875411965, -0.08050791918576636, 0.24999999999977196], [-0.23175944972705564, -0.4651851838996903, 0.24999999999960476], [0.3581514040405658, 0.7188778146810213, -0.24999999999960476], [-0.5648997332276864, 0.33420054996709736, -0.24999999999977196]];

    outer_points = 10*[[-0.4257137914058795, -0.8544883437355262, -0.29768681231614647], [0.20766159975206822, -0.8544883437355262, 0.47615788390882396], [0.490793922669076, 0.7731461234147987, -0.40170436557220773], [-0.27274173101526467, 0.9358305640562536, 0.22323329397953012], [0.06508013126319645, -0.08134222032072741, -0.6993911778883541], [-0.6984555224211442, 0.08134222032072741, -0.07445351833661629], [0.6984555224211442, -0.08134222032072741, 0.07445351833661629], [-0.06508013126319645, 0.08134222032072741, 0.6993911778883541]];

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
    color([0, 1, 0, 1]) outer_minus_AllTranslationInner(); // Opaque green
    color([1, 1, 0, 1]) outer_minus_inner_diff(); // Opaque yellow
    