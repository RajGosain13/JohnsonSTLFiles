// Auto-generated OpenSCAD file

    inner_points = 10*[[0.2558824559881848, 1.1134809877530691, 0.5000000000030929], [-0.6504210229442514, 0.6908534873760076, 0.50000000000051], [0.9062393061228075, -0.28117666064270774, -9.353628982466944e-13], [-6.41728096287264e-05, -0.7038041610197694, -3.518157987159043e-12], [0.25588245598941933, 1.1134809877565333, -0.49999999999690703], [-0.6504210229430168, 0.6908534873794716, -0.49999999999948996], [0.6578250941889378, 0.2515351583779428, -0.809016994374344], [-0.24847838474349848, -0.17109234199911882, -0.809016994376927], [0.6578250941869402, 0.251535158372338, 0.8090169943755507], [-0.248478384745496, -0.17109234200472362, 0.8090169943729678], [-0.08864545939497245, 0.6692288945346313, -1.3270070091503023]];

    outer_points = 10*[[0.939271150352653, -0.2914253703744584, 0.0802979287858217], [0.35569526368517285, -0.23342057046774728, 0.8902822667134429], [-0.3735213820712076, -0.2914253703744584, -0.865540194553496], [-0.9570972687386876, -0.23342057046774728, -0.05555585662587481], [0.7207978378522963, 0.6580298560378001, -0.14509990785767551], [0.13722195118481623, 0.7160346559445111, 0.6648844300699457], [-0.09055256736269784, 0.6580298560378001, -0.729660015936789], [-0.674128454030178, 0.7160346559445111, 0.08032432199083217], [0.2629446778976564, -0.8782209710934609, -0.36495865525691407], [-0.3206312087698237, -0.8202161711867498, 0.44502568267070713], [0.04731076808846265, 1.3929484844445685, -0.06566580635435994]];

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
    