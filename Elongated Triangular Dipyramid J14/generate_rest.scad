// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.4431428263878504, -0.4570616481590885, 0.5000000000000111], [-0.4431428263878677, -0.4570616481591002, -0.49999999999998884], [-0.38067743121914766, 0.5409854821941918, 0.4999999999999984], [-0.3806774312191651, 0.5409854821941802, -0.5000000000000016], [0.452424040256601, -0.012134702055978608, 0.49999999999999045], [0.45242404025658345, -0.012134702055990293, -0.5000000000000095], [-0.12379873911678495, 0.023929710659717798, 1.316496580927726], [-0.12379873911683055, 0.023929710659686996, -1.316496580927726]];

    outer_points = 10*[[-0.49420916328855335, 0.48885165398079056, -0.3164090653808874], [-0.4949038486176348, -0.5104484675685688, -0.27900873805973586], [0.505618378810838, 0.48885165398079056, -0.2978379571886004], [0.5049236934817566, -0.5104484675685688, -0.26043762986744884], [-0.01036718752866248, 0.5212468743624579, 0.5581465315877604], [-0.011061872857743975, -0.4780532471869015, 0.5955468589089121], [0.0009145508605564383, 1.3155751933403925, -0.0492374030438739], [-0.0009145508605564383, -1.3155751933403925, 0.0492374030438739]];

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
    