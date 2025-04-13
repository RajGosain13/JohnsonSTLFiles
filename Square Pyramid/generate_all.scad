// Auto-generated OpenSCAD file

    inner_points = 10*[[0.7245880980657288, 0.12609962772758243, 1.0181341605432133e-13], [-0.6855635385041695, 0.018990515700464568, -1.0181341605432133e-13], [0.07306683579433854, -0.6325307465709257, 7.388094116376098e-14], [-0.03404227623277932, 0.7776208899989726, -7.388094116376098e-14], [0.019512279780886727, 0.07254507171395753, -0.7071067811865476]];

    outer_points = 10*[[0.6006779226054043, 0.0, -0.37307644430392006], [-0.6006779226054043, 0.0, 0.37307644430392006], [-0.33233807096506035, 0.3213003592020604, -0.5350864283121461], [0.33233807096506035, -0.3213003592020604, 0.5350864283121461], [0.169521207763744, 0.6298937046650228, 0.2729404347869597]];

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
    