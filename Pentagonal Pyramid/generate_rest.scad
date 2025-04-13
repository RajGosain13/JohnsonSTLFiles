// Auto-generated OpenSCAD file

    inner_points = 10*[[0.23620735966763612, -0.8589852711237532, 6.281120552158003e-15], [0.3476109579235432, 0.7552090254358436, 7.186745320395964e-14], [-0.6913160481523587, -0.48522020059684634, -1.2256510252105723e-13], [-0.6224648379611696, 0.5124067391232119, -8.203051974478681e-14], [0.8782995612527119, -0.092357848796825, 1.2644704850972638e-13], [0.0296673985459932, -0.03378951119168972, 0.5257311121191336]];

    outer_points = 10*[[0.5545913541974953, -0.130465753147186, 0.6316754822336427], [-0.8029377257364648, -0.130465753147186, -0.24874986149718784], [0.7445891768936461, 0.3415637761071865, -0.22918975163436395], [-0.09440993522191399, 0.3415637761071865, -0.7733225386168263], [-0.4018328701327624, -0.422196045920001, 0.6195866695147354], [0.14198138773148855, -0.4564076590866669, -0.2189213021039538]];

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
    