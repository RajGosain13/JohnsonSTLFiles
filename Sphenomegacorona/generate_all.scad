// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.13450932832646978, 0.6137208793216535, -0.49999999999996475], [-0.30970268855061545, -0.5625709645316335, -0.5000000000000352], [-0.13450932832643542, 0.6137208793215885, 0.5000000000000352], [-0.3097026885505811, -0.5625709645316985, 0.49999999999996475], [-0.4022234175933843, 0.052401101187175045, -1.283102338831261], [-0.40222341759329616, 0.05240110118700812, 1.283102338831277], [0.4915267827134717, -0.08071135862540943, -0.8547430824889966], [0.49152678271353045, -0.08071135862552062, 0.8547430824889337], [-1.017331462216076, 0.14401343855176083, -0.499999999999965], [-1.0173314622160416, 0.1440134385516957, 0.500000000000035], [0.7029977653621209, 0.39330793047033674, -7.860303774857193e-15], [0.555685674258319, -0.5957821300472206, -6.713421756971425e-14]];

    outer_points = 10*[[-0.4935961942844095, -0.04399878007182188, -0.5983441385906083], [-0.5063460204819994, 0.04399878007182188, 0.5875939233346719], [0.5063460204819994, -0.04399878007182188, -0.5875939233346719], [0.4935961942844095, 0.04399878007182188, 0.5983441385906083], [-1.2828833411617955, 0.18160496168964152, -0.027267303587311748], [1.283173047764001, 0.18160496168964152, 0.00031994908835159333], [-0.8552676058642261, -0.7195265371946491, 0.04419460685783971], [0.8541197760563402, -0.7195265371946491, 0.06257195110839778], [-0.49933157435504716, 0.8017930567931236, -0.06486192322812147], [0.5006106404113617, 0.8017930567931236, -0.05411170797218501], [0.004675625240909675, -0.8954762230599844, -0.43490804114188575], [-0.006045121001836061, -0.8214830958078585, 0.5622930833658284]];

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
    