// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.2875681422808816, -0.4388544353225138, 0.6336308416100959], [-0.4971338823635884, 0.5520446776359796, -0.35338544423409335], [-0.1608031538888441, 0.5520446776359754, 0.5883584918141553], [-0.6238988707556259, -0.4388544353225094, -0.30811309443815277], [0.630172751148139, -0.056595121156739626, 0.5257908246330256], [0.3027146294131922, -0.7572666034014188, -0.10811031314704228], [0.4819873952312796, 0.6440763610879459, -0.17213508422896023], [0.1545292734963328, -0.05659512115673354, -0.8060362220090282], [-1.0522041318881028, 0.15177639015982886, 0.3757800487328346], [1.0522041318881037, -0.15177639015983246, -0.3757800487328346]];

    outer_points = 10*[[0.6301727511481393, -0.05659512115673544, 0.5257908246330251], [0.15452927349633117, -0.05659512115673544, -0.8060362220090281], [0.30271462941319155, -0.7572666034014177, -0.10811031314703921], [0.481987395231279, 0.6440763610879467, -0.1721350842289639], [-0.28756814228088123, -0.438854435322509, 0.6336308416100982], [-0.16080315388884367, 0.5520446776359799, 0.5883584918141529], [-0.6238988707556268, -0.438854435322509, -0.3081130944381499], [-0.49713388236358924, 0.5520446776359799, -0.3533854442340952], [1.0522041318881026, -0.15177639015983246, -0.3757800487328353], [-1.0522041318881026, 0.15177639015983246, 0.3757800487328353]];

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
    