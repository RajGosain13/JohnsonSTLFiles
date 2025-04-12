// Auto-generated OpenSCAD file

    inner_points = 10*[[0.48336147006620667, -0.796491443485512, 0.24961052401954548], [-0.0033636129242731877, 0.20724337779290775, -0.9224172448029275], [-0.02146243534842994, -0.25567359892911584, 0.9224172448029275], [-0.5081875183389098, 0.7480612223493041, -0.24961052401954548], [0.8005548202773529, -0.17771619883438955, -0.46907269909671206], [-0.008558631255711907, -0.7457756765165251, -0.6195514429901602], [-0.01626741701699122, 0.6973454553803171, 0.6195514429901602], [-0.8253808685500561, 0.12928597769818145, 0.46907269909671206], [0.7925798307638832, 0.1251835430715676, 0.4839163595474912], [0.49176718629865324, 0.7455257783134321, -0.24043663734350143], [-0.8174058790365863, -0.1736137642077757, -0.4839163595474912]];

    outer_points = 10*[[0.46952448230116467, 0.8081551775499222, -0.1758990241773695], [0.49043976285885654, -0.8081551775499222, -0.10422353473988513], [-0.49043976285885654, 0.8081551775499222, 0.10422353473988513], [-0.46952448230116467, -0.8081551775499222, 0.1758990241773695], [0.6367153111321443, -0.02307267632934869, -0.7060947254896978], [0.9165394655214069, 0.02307267632934869, 0.2528469041459849], [-0.9165394655214069, -0.02307267632934869, -0.2528469041459849], [-0.6367153111321443, 0.02307267632934869, 0.7060947254896978], [-0.23284567347195917, 0.4621349933977465, -0.7979490193051987], [-0.2199193192030657, -0.5367997424223692, -0.7536511306725492], [0.23284567347195917, -0.4621349933977465, 0.7979490193051987]];

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
    