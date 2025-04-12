// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.4074818991364223, 0.6992365292821007, 1.0000000000000828], [-0.3898663328584005, -0.9589823018207535, -0.5000000000001132], [0.44367143495763933, 0.8590426676513406, 0.5000000000000088], [-0.8242507830446055, -0.20977595545377065, -0.9999999999999784], [-0.8242507830443877, -0.20977595545400485, 1.0000000000000218], [-0.38986633285829164, -0.9589823018208707, 0.4999999999998866], [0.44367143495753053, 0.8590426676514578, -0.4999999999999911], [-0.4074818991366401, 0.6992365292823348, -0.9999999999999172], [-1.2586352332305926, 0.5394303909129777, 0.5000000000001568], [0.46128700123576977, -0.7991761634516306, -1.8726686867864828e-13], [0.8780558851437354, 0.10983632128447508, -1.2620460232426467e-13], [-1.2586352332307016, 0.539430390913095, -0.49999999999984335], [0.44954329038379176, 0.3063030572835663, 1.3333333333332769], [0.032774406475826245, -0.6027094274525393, 1.3333333333332158], [0.883927740569888, -0.44290328908329923, 0.8333333333331419]];

    outer_points = 10*[[-0.2818912922299794, 1.0259982195154702, -0.49281330432121767], [-0.4169920179568701, -1.0259982195154702, 0.38528601131022405], [0.30986993589944156, 1.0873280397967147, 0.31096359384582334], [0.3890133742874079, -1.0873280397967147, -0.20343630083482972], [-0.990100816973316, 0.3215561330780754, -0.5397240271737466], [-1.1065491135872318, -0.3215561330780754, 0.21714214814076563], [0.9994270315298034, 0.38288595335931963, 0.4791074570152818], [1.0972228990307444, -0.38288595335931963, -0.1565255779823009], [-0.18409542472903828, 0.2602263127968311, -1.1284463393188005], [-0.5147878854578112, -0.2602263127968311, 1.0209190463078066], [0.1934216392855257, 0.4442157736405639, 1.0678297691603356], [0.5054616709013238, -0.4442157736405639, -0.9603024761493418], [-0.654573100183338, 1.342585342036261, 0.3794715481636927], [-1.3627826249266748, 0.6381432555988661, 0.33256082531116393], [-0.7710213967972539, 0.6994730758801104, 1.1363377234782046]];

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
    