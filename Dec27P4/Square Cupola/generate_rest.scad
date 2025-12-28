// Auto-generated OpenSCAD file

    inner_points = 10*[[0.4640413965551187, 1.1143484030902198, 0.49999999999999933], [0.19221223995568226, 0.46157822176877006, 1.2071067811865472], [-0.19221223995568226, -0.46157822176877006, -1.2071067811865472], [-0.4640413965551187, -1.1143484030902198, -0.49999999999999933], [0.4640413965551183, 1.1143484030902195, -0.5000000000000007], [-0.19221223995568118, -0.46157822176876906, 1.2071067811865477], [0.19221223995568118, 0.46157822176876906, -1.2071067811865477], [-0.4640413965551183, -1.1143484030902195, 0.5000000000000007], [-0.3809410247220134, 0.9245993379208868, -1.6653345369377348e-16], [-0.6527701813214497, 0.2718291565994371, 0.7071067811865477], [-0.6527701813214505, 0.2718291565994365, -0.7071067811865472], [-0.9245993379208868, -0.38094102472201324, 5.551115123125783e-16]];

    outer_points = 10*[[1.2035201993020799, 0.49960866706726725, 0.09506361475190225], [1.1997598001990037, -0.49960866706726725, 0.134441001202246], [-1.1997598001990037, 0.49960866706726725, -0.134441001202246], [-1.2035201993020799, -0.49960866706726725, -0.09506361475190225], [0.5022747882439678, 1.2061620199129408, -7.479318947997693e-07], [0.4931963817293862, -1.2061620199129408, 0.09506467248733161], [-0.4931963817293862, 1.2061620199129408, -0.09506467248733161], [-0.5022747882439678, -1.2061620199129408, 7.479318947997693e-07], [0.4324480499089029, 0.5275793585592033, 0.7311967618584252], [0.42868765080582694, -0.47163797557533116, 0.770574148308769], [-0.5630231200644511, 0.5275793585592033, 0.6361328373029884], [-0.566783519167527, -0.47163797557533116, 0.6755102237533323]];

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
    