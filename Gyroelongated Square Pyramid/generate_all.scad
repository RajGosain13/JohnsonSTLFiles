// Auto-generated OpenSCAD file

    inner_points = 10*[[0.47553456087715823, 0.4978078842969692, -0.2072352496078125], [-0.22709237834801976, -0.6940962000115061, -0.4999467766849563], [-0.36142103174737733, 0.2749515102768153, -0.7070755966518479], [0.6098632142765158, -0.47123982599135217, -0.00010642964092089091], [-0.41688364699083813, 0.6763916464639828, 0.20712881996862775], [-0.9137159203613099, -0.16641181407448244, 0.00015051424090967158], [0.2699180298323196, 0.14875469252611018, 0.7070315120518591], [-0.22691424353815204, -0.694048768012355, 0.500053206324141], [0.4993618307547157, -0.17324932327067738, -0.948257843987832]];

    outer_points = 10*[[-0.42003278146638656, 0.681501101519495, 0.18948721966919727], [-0.3451825718394467, -0.7303265261001592, 0.15572043112390738], [-0.09183323192223902, -0.024412712290332116, 0.8171581072778895], [-0.6733821213835942, -0.024412712290332116, -0.4719504564847848], [0.5617527129175098, 0.5235691569685188, 0.2951032407441999], [0.6146798037179536, -0.47474373238785456, 0.2712265155849332], [0.15053554958787962, 0.5235691569685188, -0.6164341663780378], [0.2034626403883234, -0.47474373238785456, -0.6403108915373046], [-1.0260745241448967, -0.06546983679345328, 0.4628877014666302]];

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
    