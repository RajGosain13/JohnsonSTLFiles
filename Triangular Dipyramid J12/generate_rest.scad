// Auto-generated OpenSCAD file

    inner_points = 10*[[0.1821393068757838, 0.1913870506433806, -0.766553282190714], [-0.21273894850983668, -0.20901536236239762, 0.766553282190714], [-0.5749142746609799, 0.0005416474787896391, -0.14169497283306184], [0.24202588352164686, 0.471177062130277, 0.19163832047015342], [0.2869889286882537, -0.4981611771875922, -0.0499433476370916]];

    outer_points = 10*[[-0.0010710062446377955, -0.001087881755346909, 0.8164951537673552], [0.0010710062446377955, 0.001087881755346909, -0.8164951537673552], [-0.5773495172173777, 0.0005439408776734544, -0.0007565913797176194], [0.2882045658240988, -0.5002713047271171, -0.0002885101452453076], [0.2891449513932788, 0.49972736384944366, 0.001045101524962927]];

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
    