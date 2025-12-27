// Auto-generated OpenSCAD file

    inner_points = 10*[[0.5559449618614191, -0.3881500309253424, -0.49999999999987577], [0.5559449618612677, -0.388150030925249, 0.5000000000001242], [0.48020738242017447, 0.6089777537945407, -0.4999999999999803], [0.48020738242002303, 0.6089777537946339, 0.5000000000000198], [-0.4411828228584638, -0.463887610366587, -0.5000000000000198], [-0.4411828228586152, -0.46388761036649373, 0.4999999999999803], [-0.5169204022997085, 0.5332401743532961, -0.5000000000001242], [-0.5169204022998598, 0.5332401743533893, 0.49999999999987577], [0.019512279780962472, 0.0725450717139109, -1.2071067811865475]];

    outer_points = 10*[[0.3096145243221563, 0.6725957727848044, -0.4491700933508113], [0.06987533319280242, -0.21820844720590366, -0.8351661579465389], [0.7796115315738568, 0.21820844720590366, 0.3075563906100046], [0.5398723404445028, -0.6725957727848044, -0.07843967398572299], [-0.5398723404445028, 0.6725957727848044, 0.07843967398572299], [-0.7796115315738568, -0.21820844720590366, -0.3075563906100046], [-0.06987533319280242, 0.21820844720590366, 0.8351661579465389], [-0.3096145243221563, -0.6725957727848044, 0.4491700933508113], [0.28939080332842093, 1.0752958146603768, 0.46593846708482345]];

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
    