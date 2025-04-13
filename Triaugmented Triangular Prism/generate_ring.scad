// Auto-generated OpenSCAD file

    inner_points = 10*[[0.3968794289832836, -0.24366904809970863, 0.47769744652866364], [0.1044370337410087, 0.7116152041618212, 0.43400027446809336], [0.28001866757022104, -0.32472141302800633, -0.512137931997225], [-0.012423727672053866, 0.6305628392335235, -0.5558351040577953], [-0.483509439683674, -0.5304611105401444, 0.0999862435594168], [-0.7759518349259489, 0.4248231417213853, 0.05628907149884649], [-0.45353704140965617, 0.039673656440986374, 0.9209905083602004], [-0.6550920403237519, -0.10012099428325462, -0.7862229842742783], [0.8633541457398265, 0.39452214456670354, -0.13476752408592219]];

    outer_points = 10*[[0.5060778848187576, -0.5313859144211572, 0.21177232535318735], [0.4838884138968741, 0.07018910183659147, -0.5867357379715961], [-0.4935362337764729, -0.5313859144211572, 0.2395502645330591], [-0.5157257046983563, 0.07018910183659147, -0.5589577987917242], [0.020742555340540487, 0.1604093044556914, 0.7464395051009286], [-0.0014469155813429608, 0.76198432071344, -0.05206855822385477], [0.8703596761375976, 0.39772341860368887, 0.275448253298233], [-0.8537196482801497, 0.39772341860368887, 0.3233581114365443], [-0.016640027857447785, -0.7954468372073777, -0.5988063647347773]];

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
    