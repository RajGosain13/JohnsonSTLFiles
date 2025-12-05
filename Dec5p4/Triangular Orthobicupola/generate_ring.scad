// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.8291415458319079, 0.4663499702585989, 2.058495952064754e-05], [-0.07855180895714171, 0.8983503547280824, 0.5000112995897901], [-0.078569895871595, 0.898360286145608, -0.4999887001973251], [0.7360452910153114, -0.5169581736692761, 0.4999825100217997], [-0.6720275168609681, -0.3853110430415919, 0.5000092851568458], [0.8291157830596579, 0.4787095887324264, -0.5000092851568458], [-0.014544445859454913, -0.9489585581387598, -8.204608469786212e-06], [0.07856222001379826, 0.04668934142789162, 0.9999999997871154], [0.07852604618489165, 0.046709204262942824, -0.9999999997871154], [0.7360272041008581, -0.5169482422517505, -0.5000174897653156], [-0.6720456037754214, -0.38530111162406633, -0.4999907146302695], [0.8291338699741113, 0.47869965731490083, 0.4999907146302695]];

    outer_points = 10*[[-0.2886740751691849, -0.49999976883649444, -0.8164970970485246], [-0.2886739150147398, 0.500000231163467, -0.8164968705552657], [0.5773514086916217, 9.246539450780134e-08, -0.8164957751769395], [-0.2886761940198712, 0.49999986130188906, 0.8164962912985543], [-0.8660254838608068, -0.49999986130188906, -1.3218715850804585e-06], [0.8660254838608068, 0.49999986130188906, 1.3218715850804585e-06], [-0.2886763541743163, -0.5000001386980726, 0.8164960648052954], [-0.8660253237063618, 0.5000001386980726, -1.0953783261546945e-06], [0.8660253237063618, -0.5000001386980726, 1.0953783261546945e-06], [0.5773491296864904, -2.77396183523404e-07, 0.8164973866768803], [-1.6015444513559745e-07, -0.9999999999999616, -2.2649325892100838e-07], [1.6015444513559745e-07, 0.9999999999999616, 2.2649325892100838e-07]];

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
    