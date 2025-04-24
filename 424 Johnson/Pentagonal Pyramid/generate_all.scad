// Auto-generated OpenSCAD file

    inner_points = 10*[[0.006041051977101475, -0.8080237563375162, 0.5000000000006635], [-0.29124754295317146, 0.09537426696641924, -0.8090169943752008], [-0.29124754295042443, 0.09537426696896514, 0.8090169943746941], [-0.47498199908503275, 0.6537049507402669, -8.199552148369094e-13], [0.006041051975403666, -0.8080237563390895, -0.49999999999933664], [0.2903071489285415, 0.010018287888955535, -1.106413997394639e-12]];

    outer_points = 10*[[-0.7978099914491895, -0.2625428334534335, -0.13482312819418532], [0.8017357049911781, -0.2625428334534335, 0.10907757649728182], [-0.49942562922089523, 0.687346061483792, -0.04166809798888336], [0.4891479777378736, 0.687346061483792, 0.10907082739049428], [0.006351937941033116, -0.8496064560607167, -0.04165717770470741], [-0.07915084916165496, -0.02604313074481797, 0.5190858316964722]];

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
    