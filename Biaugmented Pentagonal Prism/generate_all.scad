// Auto-generated OpenSCAD file

    inner_points = 10*[[0.019787791635657748, -0.14747479922424916, -0.945991098230778], [-0.6594221428128932, 0.5435520084277206, -0.6986940783281456], [-0.14991280650270666, -0.8349261534325039, 0.5088787692620549], [-0.8291227409512576, -0.14389934578053432, 0.7561757891646873], [0.678236401517591, 0.27739350328859563, -0.3247565582505837], [-0.0009735329309600027, 0.9684203109405655, -0.07745953834795122], [0.5733556639568946, -0.1474747992242489, 0.5744024690680427], [-0.10585427049165638, 0.5435520084277209, 0.8216994889706752], [-0.49203656667719314, -0.8349261534325041, -0.430776131605317], [-1.171246501125744, -0.14389934578053443, -0.18347911170268458], [0.2386660365849197, 0.823975401935654, -1.03751607052968], [-0.039688911151111894, -0.3036310288659764, 1.3488645926575207]];

    outer_points = 10*[[-0.8032370415536442, 0.4940095944296054, 0.2904678526749993], [-0.8203617651133189, -0.05438177544706052, -0.5455785869967444], [0.8144576288440243, 0.4940095944296054, 0.257332643050285], [0.7973329052843495, -0.05438177544706052, -0.5787137966214586], [-0.4836041683692091, -0.30128460130981144, 0.8055814019076486], [-0.5007288919288839, -0.8496759711864774, -0.030465037764095003], [0.5161861213561083, -0.30128460130981144, 0.7851027161352226], [0.4990613977964336, -0.8496759711864774, -0.05094372353652105], [-0.0009907313780924036, 0.9855284384520768, -0.04836851458879643], [-0.01811545493776716, 0.43713706857541085, -0.8844149542605402], [-1.321886530779726, -0.3605543525439317, 0.26357607217362455], [1.3315709135143465, -0.3605543525439317, 0.20922535305718643]];

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
    