// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.9313235840465552, 0.025941713534936496, 0.24961039887898973], [0.18176070420337553, 0.09962140742080969, -0.9224171855702517], [-0.21156256215452457, -0.14515796252296415, 0.9224171855702517], [0.9015217260954063, -0.07147826863709097, -0.24961039887898973], [-0.6438494477287671, -0.3764461593931605, -0.6195516232254873], [-0.5505502074210448, 0.607754695616786, -0.46907262550257495], [0.5207483494698958, -0.6532912507189405, 0.46907262550257495], [0.6140475897776181, 0.330909604291006, 0.6195516232254873], [0.2535803612941774, -0.7962352175813989, -0.48391650792537955], [0.4045417032366162, 0.7962352175814017, -0.24043637501668932]];

    outer_points = 10*[[-0.46997284627252917, -0.8078951994968868, 0.17589589984947596], [-0.43345305778897786, 0.8078951994968868, 0.25284835477167783], [0.43345305778897786, -0.8078951994968868, -0.25284835477167783], [0.46997284627252917, 0.8078951994968868, -0.17589589984947596], [-0.9449617853062939, 0.026321601166102375, -0.10422521197036727], [-0.5168120337823261, -0.026321601166102375, 0.7979479884286332], [0.5168120337823261, 0.026321601166102375, -0.7979479884286332], [0.9449617853062939, -0.026321601166102375, 0.10422521197036727], [-0.3350951898479052, 0.5418959379620255, -0.7060938346625941], [0.3576656603926969, 0.45671744731188046, 0.753653067322259]];

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
    