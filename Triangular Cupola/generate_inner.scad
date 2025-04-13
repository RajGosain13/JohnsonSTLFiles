// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.5067955693093701, -0.2765711460282869, 0.8164965809276397], [0.47903674428989906, -0.8777932204727784, 1.4395706848802092e-12], [-0.47903813632393366, 0.8777957186404731, -1.4395706848802092e-12], [0.4929154607816119, -0.3006097881369385, 0.8164965809284891], [-0.5206742858010829, -0.8537545783641267, 5.901945598907332e-13], [0.5206728937670484, 0.8537570765318214, -5.901945598907332e-13], [0.013878020474695501, 0.577184681419687, 0.8164965809270495], [0.9997103340739647, -0.024037393024804222, 8.493389008763497e-13], [-0.9997117261079992, 0.02403989119249895, -8.493389008763497e-13]];

    outer_points = 10*[[-0.512923269542972, -0.04952440908620236, 0.8570046980419713], [0.8557409845176946, 0.04952440908620236, 0.5150288344562363], [-0.8557409845176946, -0.04952440908620236, -0.5150288344562363], [0.12336155278650156, 0.7053703515917454, 0.6980219154077046], [0.21945616218822123, -0.7053703515917454, 0.674011617090503], [-0.21945616218822123, 0.7053703515917454, -0.674011617090503], [-0.7323794317311931, 0.6558459425055431, 0.1829930809514684], [0.6362848223294735, 0.7548947606779478, -0.15898278263426666], [-0.6362848223294735, -0.7548947606779478, 0.15898278263426666]];

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
    