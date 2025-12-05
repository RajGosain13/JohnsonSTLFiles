// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.5843169179657698, -0.6879231760558433, -0.9476863813058384], [-0.8215331245846192, -1.0182565838404067, -0.03411738499587125], [0.6903670649661048, 1.1119849418432066, 0.03411738499587125], [0.4531508583472553, 0.7816515340586432, 0.9476863813058384], [-0.04323343492736341, 0.07283869886099822, -1.3061135483231257], [-0.6159240181612884, -0.7246566943174167, 0.8994371127319727], [0.4847579585427739, 0.8183850523202166, -0.8994371127319727], [-0.08793262469115103, 0.02088965914180165, 1.3061135483231257], [0.36563737174037947, -0.5700346554462439, -0.6583956206905608], [0.12842116512152985, -0.9003680632308071, 0.25517337561940623], [0.8936287652105167, 0.17551169801297445, -0.251719185099408], [0.6564125585916671, -0.1548217097715889, 0.6618498112105591]];

    outer_points = 10*[[-0.9731118629091229, -0.4413118352277251, 0.7519334728152625], [-0.619892288935397, 0.4413118352277251, 1.0621130803228622], [0.619892288935397, -0.4413118352277251, -1.0621130803228622], [0.9731118629091229, 0.4413118352277251, -0.7519334728152625], [-0.7562957052968324, -1.0654210178425345, 0.0012814349347830545], [0.09645178068618293, 1.0654210178425345, 0.7501212501511937], [-0.09645178068618293, -1.0654210178425345, -0.7501212501511937], [0.7562957052968324, 1.0654210178425345, -0.0012814349347830545], [-0.03757443368860547, -0.7737087789198632, 0.632426191231289], [0.3156451402851202, 0.10891489153558698, 0.9426057987388886], [0.622269490922044, -0.7737087789198632, -0.11897649385468778], [0.9754890648957697, 0.10891489153558698, 0.19120311365291187]];

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
    