// Auto-generated OpenSCAD file

    inner_points = 10*[[1.4359011870482463, 0.5533730837177137, -0.5000000000000805], [-1.4359011870482463, -0.5533730837177137, 0.5000000000000805], [0.8874357380822848, 0.34200337419673843, 1.3090169943748977], [1.483420692140161e-13, -1.4966410443445797e-13, 1.618033988749895], [-1.483420692140161e-13, 1.4966410443445797e-13, -1.618033988749895], [-0.8874357380822848, -0.34200337419673843, -1.3090169943748977], [1.4359011870483378, 0.5533730837176212, 0.4999999999999195], [-0.887435738082045, -0.3420033741969806, 1.3090169943749972], [0.887435738082045, 0.3420033741969806, -1.3090169943749972], [-1.4359011870483378, -0.5533730837176212, -0.4999999999999195], [0.05622638989055023, 0.5850898186537883, 0.8090169943749964], [0.434336020988879, -0.39603500310477363, 0.809016994374871], [0.6046918388566034, 0.7964595281746711, 1.8207657603852567e-14], [0.9828014699549321, -0.18466529358389083, -1.0721978860317449e-13], [-0.8312093481916429, 0.2430864444569574, 0.5000000000000987], [-0.45309971709331415, -0.7380383773016045, 0.49999999999997324], [0.05622638989040191, 0.5850898186539379, -0.8090169943748985], [0.4343360209887307, -0.3960350031046239, -0.809016994375024], [-0.8312093481917346, 0.24308644445704983, -0.4999999999999013], [-0.4530997170934058, -0.738038377301512, -0.5000000000000268]];

    outer_points = 10*[[-1.562151832989105, 0.0, -0.42156332791014234], [1.562151832989105, 0.0, 0.42156332791014234], [-0.5807729208038567, 1.4921233423461835, 0.23303376243906446], [0.3846900075713595, 1.4921233423461835, 0.4935742274980496], [-0.3846900075713595, -1.4921233423461835, -0.4935742274980496], [0.5807729208038567, -1.4921233423461835, -0.23303376243906446], [-1.3244003331775505, 0.9221829409770366, -0.11651767934537474], [1.2032144281867707, 0.9221829409770366, 0.5655861136237528], [-1.2032144281867707, -0.9221829409770366, -0.5655861136237528], [1.3244003331775505, -0.9221829409770366, 0.11651767934537474], [-0.18701174725268985, 0.6962659651294776, 0.692993731711776], [0.07861977866300407, 0.9533850298427866, -0.29133471347343615], [-0.9306391596263837, 0.12632556376033077, 0.34344228992733694], [-0.6650076337106898, 0.3834446284736398, -0.6408861552578753], [0.6315126733627214, 0.12632556376033077, 0.7650056178374792], [0.8971441992784153, 0.3834446284736398, -0.21932282734773292], [-0.5717017548240494, -0.7958573772167059, 0.19941950421372653], [-0.3060702289083555, -0.5387383125033969, -0.7849089409714857], [0.3937611735511668, -0.7958573772167059, 0.45995996927271166], [0.6593926994668606, -0.5387383125033969, -0.5243684759125006]];

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
    