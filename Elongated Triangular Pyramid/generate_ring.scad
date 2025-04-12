// Auto-generated OpenSCAD file

    inner_points = 10*[[0.41372241203438104, 0.5161844232125496, -0.5000000000005286], [0.41372241203630644, 0.5161844232124951, 0.4999999999994715], [-0.4523012409070252, 0.01618139067572292, -0.49999999999888844], [-0.45230124090509977, 0.01618139067566849, 0.5000000000011117], [0.4137259137098271, -0.48381557678131953, -0.500000000000583], [0.41372591371175244, -0.483815576781374, 0.49999999999941697], [0.125049028277489, 0.016183412369028788, -1.316496580927726]];

    outer_points = 10*[[-0.47409817149378863, 0.5195152510494393, 0.29777199506773233], [-0.5358247145183108, -0.47788127840371986, 0.2604893325952726], [0.04291122844378145, 0.5195152510494393, -0.5582077245379332], [-0.018815314580740705, -0.47788127840371986, -0.5954903870103929], [0.5237767575867904, 0.4570642920808602, 0.3163597231788905], [0.4620502145622683, -0.540332237372299, 0.2790770607064307], [0.08126278284427152, 1.313069120854264, 0.049082497672875716]];

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
    