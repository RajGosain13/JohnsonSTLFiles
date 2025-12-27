// Auto-generated OpenSCAD file

    inner_points = 10*[[0.23620735966756062, -0.8589852711237683, 0.5000000000000063], [0.23620735966771172, -0.858985271123738, -0.4999999999999937], [0.34761095792346763, 0.7552090254358284, 0.5000000000000718], [0.34761095792361874, 0.7552090254358587, -0.4999999999999281], [-0.6913160481524341, -0.4852202005968615, 0.49999999999987743], [-0.6913160481522832, -0.48522020059683124, -0.5000000000001226], [-0.6224648379612451, 0.5124067391231968, 0.49999999999991795], [-0.6224648379610942, 0.512406739123227, -0.5000000000000819], [0.8782995612526363, -0.09235784879684011, 0.5000000000001265], [0.8782995612527874, -0.09235784879680989, -0.49999999999987355], [0.029667398545917656, -0.03378951119170483, 1.0257311121191337]];

    outer_points = 10*[[0.6896236781921562, -0.5645352314085775, 0.42346895131185747], [0.41955903020283425, 0.3036037251142055, 0.8398820131554279], [-0.6679054017418039, -0.5645352314085775, -0.456956392418973], [-0.9379700497311259, 0.3036037251142055, -0.04054333057540266], [0.879621500888307, -0.092505702154205, -0.43739628255614915], [0.6095568528989852, 0.775633254368578, -0.0209832207125788], [0.04062238877274693, -0.092505702154205, -0.9815290695386115], [-0.22944225921657496, 0.775633254368578, -0.5651160076950412], [-0.26680054613810145, -0.8562655241813926, 0.41138013859295025], [-0.5368651941274234, 0.011873432341390544, 0.8277932004365205], [0.2770137117261496, -0.8904771373480586, -0.42712783302573903]];

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
    