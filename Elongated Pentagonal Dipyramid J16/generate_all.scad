// Auto-generated OpenSCAD file

    inner_points = 10*[[0.2467382987372412, -0.7682886734949378, -0.49999999999986955], [0.24673829873693467, -0.7682886734948948, 0.5000000000001305], [-0.786615939624791, 0.4767868289582747, -0.5000000000002401], [-0.7866159396250976, 0.47678682895831764, 0.4999999999997599], [0.7812222187521125, 0.07688996989682276, -0.499999999999742], [0.7812222187518058, 0.07688996989686578, 0.5000000000002579], [0.14257417702561617, 0.8463889489727611, -0.499999999999971], [0.14257417702530947, 0.8463889489728041, 0.500000000000029], [-0.7222389719987257, -0.5211388226006342, -0.5000000000001773], [-0.7222389719990324, -0.5211388226005911, 0.49999999999982264], [-0.06766404342154811, 0.022127650346434623, -1.0257311121191337], [-0.06766404342217727, 0.022127650346523024, 1.0257311121191337]];

    outer_points = 10*[[0.49039615507641166, 0.4938060709977507, -0.6994812171045163], [0.5040254575535104, -0.5059280714671878, -0.6808831929115636], [-0.8147039687334786, 0.4938060709977507, 0.25694319474479665], [-0.8010746662563799, -0.5059280714671878, 0.2755412189377493], [0.8031669173012401, 0.5157349758527835, 0.2500942530026042], [0.8167962197783389, -0.48399916661215503, 0.26869227719555683], [-0.0034293179349679237, 0.5157349758527835, 0.8411970471956072], [0.010199984542130835, -0.48399916661215503, 0.8597950713885598], [-0.5095030419019521, 0.48025326246127786, -0.6952483383208733], [-0.49587373942485335, -0.5194808800036607, -0.6766503141279206], [-0.01397999958724252, 1.02545841377403, -0.019076572038655804], [0.01397999958724252, -1.02545841377403, 0.019076572038655804]];

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
    