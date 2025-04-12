// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.36537328936366986, -0.5630248957199848, -0.2041241481408165], [-0.07665632407859727, 0.2534568958636895, -0.7041241461097079], [-0.28588836871909684, -0.06302896737091813, 0.6582482882371564], [0.0028285965659757967, 0.7534528242127562, 0.15824829026826498], [0.5006521103988715, -0.5630692614318152, 0.29587585685699724], [0.7893690756839442, 0.25341253015185916, -0.20412414111189417], [0.5006521161698728, -0.5630692609848701, -0.7041241431430026], [0.6377433254045676, 0.299296152151859, 0.7832482937293753]];

    outer_points = 10*[[0.5030398526543044, -0.5657546721443936, 0.10102420958195456], [0.4844053090391255, 0.18317157791304, -0.5613670839592305], [-0.49656467091517004, -0.5657546721443936, 0.12914531303547902], [-0.515199214530349, 0.18317157791304, -0.533245980505706], [0.021476633683634054, 0.008119969202636801, 0.763417417694344], [0.002842090068455094, 0.7570462192600704, 0.10102612415315894], [0.872517286240693, 0.3299291148283261, 0.34848527687259606], [-0.8515454892055908, 0.3299291148283261, 0.39698700583193464]];

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
    