// Auto-generated OpenSCAD file

    inner_points = 10*[[-1.4436247026081666, 0.53290472179478, 0.5000000000005375], [1.4436191328390864, -0.5329090469609368, -0.5000000000005375], [-1.1065387952767085, -0.12450860318088203, 1.1739293814812473], [-1.2292961042735038, 0.9867657297769106, -0.36491238710543017], [1.2292905345044236, -0.9867700549430674, 0.36491238710543017], [1.1065332255076283, 0.12450427801472524, -1.1739293814812473], [-0.3467937417511487, -0.7343646996664531, 1.3994576396282619], [-0.5454192400754369, 1.0637149418846232, -1.0904406452529822], [0.5454136703063569, -1.06371926705078, 1.0904406452529822], [0.3467881719820686, 0.7343603745002963, -1.3994576396282619], [-0.9737754103851414, 0.030062411297536226, -0.22552825814749344], [0.4698465073384851, -0.5028444730803222, -0.7255282581480309], [-0.6366895030536831, -0.6273509136781259, 0.44840112333321624], [0.25551790900382226, -0.9567054810624528, 0.13938412895793664], [-0.28989854618707456, 0.10701162340524878, -0.9510565162950456]];

    outer_points = 10*[[1.5631233177982589, 0.0, 0.4179467455373456], [-1.5631233177982589, 0.0, -0.4179467455373456], [1.4296084444676138, 0.7045531263704787, -0.27903149710806596], [1.0995782123374722, -0.7045531263704787, 0.9552835368748945], [-1.0995782123374722, 0.7045531263704787, -0.9552835368748945], [-1.4296084444676138, -0.7045531263704787, 0.27903149710806596], [0.750031735954207, 1.1399909053474344, -0.8694291917899644], [0.2160316030526203, -1.1399909053474344, 1.1277344860194474], [-0.2160316030526203, 1.1399909053474344, -1.1277344860194474], [-0.750031735954207, -1.1399909053474344, 0.8694291917899644], [0.8365540911892785, -0.5478743958362549, 0.0033013484425665762], [-0.7265692266089804, -0.5478743958362549, -0.41464539709477904], [0.7030392178586335, 0.1566787305342239, -0.6936768942028451], [-0.26302412114819385, 0.1566787305342239, -0.9519821884323281], [-0.04699251809557352, -0.9833121748132105, 0.1757522975871193]];

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
    