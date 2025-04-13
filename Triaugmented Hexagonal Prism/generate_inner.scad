// Auto-generated OpenSCAD file

    inner_points = 10*[[0.599886064142325, -0.8909680205958462, -0.5000000000000165], [0.7642449049774599, 0.095432593474994, -0.500000000000021], [-1.1086099160454883, -0.6062901575962651, 0.500000000000021], [-0.9442510752103533, 0.3801104564745751, 0.5000000000000165], [0.599886064142347, -0.8909680205958453, 0.4999999999999834], [0.764244904977482, 0.09543259347499483, 0.49999999999997896], [-0.2543619259516038, -0.7486290890960565, -0.9999999999999978], [-0.09000308511646875, 0.23777152497478365, -1.0000000000000022], [-0.2543619259515596, -0.7486290890960547, 1.0000000000000022], [-0.09000308511642456, 0.23777152497478538, 0.9999999999999978], [-1.1086099160455103, -0.606290157596266, -0.49999999999997896], [-0.9442510752103753, 0.3801104564745742, -0.4999999999999834], [1.3795560477359692, -0.51398696446291, -3.397282455352979e-14], [-0.9480517821689757, -0.12614969085949718, 1.3623724356958116], [-0.948051782169036, -0.12614969085949948, -1.3623724356957776]];

    outer_points = 10*[[-1.0227603980993214, -0.3734255004598836, 0.25399717259450516], [-0.9712245325180885, 0.3734255004598836, -0.40899425795639943], [0.9712245325180885, -0.3734255004598836, 0.40899425795639943], [1.0227603980993214, 0.3734255004598836, -0.25399717259450516], [-0.47413873270521345, -0.9493249594098434, -0.3521002465068624], [-0.4226028671239805, -0.20247395849007616, -1.0150916770577671], [-0.5743895981847245, 0.20247395849007616, 0.9375931343768199], [-0.5228537326034916, 0.9493249594098434, 0.27460170382591526], [0.5228537326034916, -0.9493249594098434, -0.27460170382591526], [0.5743895981847245, -0.20247395849007616, -0.9375931343768199], [0.4226028671239805, 0.20247395849007616, 1.0150916770577671], [0.47413873270521345, 0.9493249594098434, 0.3521002465068624], [-1.312748714738331, -0.5230596990703646, -0.6912627825601987], [1.4038013919276195, -0.5230596990703646, -0.4800990258499658], [-0.09105267718928864, 1.0461193981407293, 1.1713618084101645]];

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
    