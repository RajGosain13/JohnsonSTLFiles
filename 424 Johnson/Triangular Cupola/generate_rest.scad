// Auto-generated OpenSCAD file

    inner_points = 10*[[0.5483513328711939, -0.49343059621073404, 0.5000000000001427], [-0.8147584849794822, -0.1166924584026583, 0.5000000000000114], [0.8147454248469246, 0.4704335994932656, -0.5000000000000114], [-0.2664006220419612, -0.7869936251588691, 1.539879335155092e-13], [-6.530066327234646e-06, 0.17687057054547678, 1.0], [-6.5300662304823955e-06, 0.1768705705451305, -1.0], [0.5483513328712422, -0.4934305962109071, -0.4999999999998575], [-0.8147584849794339, -0.11669245840283138, -0.4999999999999886], [0.8147454248468763, 0.47043359949343866, 0.4999999999999886]];

    outer_points = 10*[[0.2886841223116632, 0.4999680237807507, -0.8165129838048599], [0.8660438627157157, -0.4999680237807507, 5.5219683157359256e-05], [-0.8660438627157157, 0.4999680237807507, -5.5219683157359256e-05], [0.2887210423333781, -0.5000319741744229, -0.8164607672859469], [0.8660069426940007, 0.5000319741744229, 3.0031642442862605e-06], [-0.8660069426940007, -0.5000319741744229, -3.0031642442862605e-06], [-0.5773228203823376, -6.395039367218525e-05, -0.8165159869691043], [3.692002171488182e-05, -0.9999999979551737, 5.221651891308081e-05], [-3.692002171488182e-05, 0.9999999979551737, -5.221651891308081e-05]];

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
    color([1, 1, 0, 1]) outer_minus_inner_diff(); // Opaque yellow
    