// Auto-generated OpenSCAD file

    inner_points = 10*[[0.4479590588990513, -0.5250898206093074, -7.05324687544362e-13], [0.4165075656405067, 0.4744154588023662, 2.0339285811132868e-13], [-0.417637904288353, -0.5523276127577147, -0.5000000000003288], [-0.44908939754689753, 0.44717766665395897, -0.49999999999942013], [-0.41763790428788994, -0.5523276127586092, 0.49999999999967115], [-0.44908939754643434, 0.44717766665306447, 0.5000000000005798], [0.352813311127668, -0.027836294896346484, -0.862372435696011]];

    outer_points = 10*[[0.26573559772755095, 0.3038927930034916, 0.6483572285355131], [-0.6597836115012342, 0.2731852040296694, 0.2709036057844004], [0.6433673075177818, 0.3038927930034916, -0.27759865149382545], [-0.28215190171100324, 0.2731852040296694, -0.6550522742449382], [0.47917590859784487, -0.5617242025462499, 0.1954218570849814], [-0.4463433006309402, -0.5924317915200721, -0.18203176566613136], [-0.028313936102664725, 0.9953123157758751, -0.01154724575106305]];

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
    