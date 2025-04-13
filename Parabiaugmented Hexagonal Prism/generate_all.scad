// Auto-generated OpenSCAD file

    inner_points = 10*[[0.8660275601949093, -0.49999626496864946, -0.5000000000002527], [0.8660232473576305, 0.5000037350220502, -0.5000000000001439], [2.1564184105024137e-06, -0.49999999999524114, -1.0000000000000544], [-2.156418868470349e-06, 0.4999999999954585, -0.9999999999999456], [2.156418868470349e-06, -0.4999999999954585, 0.9999999999999456], [-2.1564184105024137e-06, 0.49999999999524114, 1.0000000000000544], [-0.8660232473576305, -0.5000037350220502, 0.5000000000001439], [-0.8660275601949093, 0.49999626496864946, 0.5000000000002527], [0.8660275601951383, -0.49999626496875815, 0.49999999999974737], [0.8660232473578595, 0.5000037350219414, 0.4999999999998561], [-0.8660232473578595, -0.5000037350219414, -0.4999999999998561], [-0.8660275601951383, 0.49999626496875815, -0.49999999999974737], [0.7865660924778658, 3.3923317141515653e-06, -1.3623724356959748], [-0.7865660924778658, -3.3923317141515653e-06, 1.3623724356959748]];

    outer_points = 10*[[0.8668436236259911, -0.0019279514490723182, -0.7061008534070546], [0.8660225906704068, -0.707104152868027, 0.002930775546985575], [0.866027055663365, 0.707104152868027, -0.0009251247660098337], [0.8652060227077807, 0.0019279514490723182, 0.7081065041880305], [-0.8652060227077807, -0.0019279514490723182, -0.7081065041880305], [-0.866027055663365, -0.707104152868027, 0.0009251247660098337], [-0.8660225906704068, 0.707104152868027, -0.002930775546985575], [-0.8668436236259911, 0.0019279514490723182, 0.7061008534070546], [0.0012270844404182679, -0.35644400360762196, -1.0596915431180651], [0.0004060514848339595, -1.0616202050265766, -0.3506599141640247], [-0.0004060514848339595, 1.0616202050265766, 0.3506599141640247], [-0.0012270844404182679, 0.35644400360762196, 1.0596915431180651], [1.573131130281187, 0.0, 0.0018216288930887289], [-1.573131130281187, 0.0, -0.0018216288930887289]];

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
    