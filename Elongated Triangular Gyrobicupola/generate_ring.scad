// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.5727942453287636, -0.8196991841635889, -0.49999999999979927], [0.572794245328764, 0.8196991841635887, 0.49999999999979927], [0.4234831942827272, -0.9059039596778707, 0.5000000000000533], [-0.42348319428272685, 0.9059039596778705, -0.5000000000000533], [0.9962774396112515, -0.08620477551448197, -0.5000000000001475], [-0.996277439611251, 0.08620477551448175, 0.5000000000001475], [0.9962774396114111, -0.08620477551434857, 0.49999999999985245], [-0.9962774396114107, 0.08620477551434835, -0.49999999999985245], [0.5727942453286043, 0.8196991841634554, -0.5000000000002008], [-0.5727942453286039, -0.8196991841634557, 0.5000000000002008], [0.42348319428256764, -0.905903959678004, -0.4999999999999469], [-0.4234831942825673, 0.9059039596780037, 0.4999999999999469], [0.5230238949797952, 0.24449813621619343, -1.3164965809278422], [-0.5230238949797947, -0.24449813621619365, 1.3164965809278422], [-0.049770350348888805, -0.5752010479473287, -1.3164965809276414], [0.04977035034888918, 0.5752010479473285, 1.3164965809276414], [-0.47325354463153607, 0.33070291173060856, -1.3164965809276947], [0.4732535446315364, -0.3307029117306088, 1.3164965809276947]];

    outer_points = 10*[[0.5298790273108971, -0.49733729572507634, -0.8496374701582584], [-0.5298790273108971, 0.49733729572507634, 0.8496374701582584], [-0.5206247255916664, -0.9885998081008317, -0.040253130631053124], [0.5206247255916664, 0.9885998081008317, 0.040253130631053124], [0.44745605235875646, -0.5243669819275101, 0.8802399385802442], [-0.44745605235875646, 0.5243669819275101, -0.8802399385802442], [-0.5511838178154568, -0.5022973355596736, 0.833002872544885], [0.5511838178154568, 0.5022973355596736, -0.833002872544885], [0.46876084286331626, 0.47526764935724, 0.8968745361936177], [-0.46876084286331626, -0.47526764935724, -0.8968745361936177], [0.4780151445825469, -1.010669454468668, 0.006983935404306196], [-0.4780151445825469, 1.010669454468668, -0.006983935404306196], [1.287231649678413, -0.038064509386351864, 0.6388132388414419], [-1.287231649678413, 0.038064509386351864, -0.6388132388414419], [1.3177907419022037, -0.5243669819275101, -0.23444276433449618], [-1.3177907419022037, 0.5243669819275101, 0.23444276433449618], [1.3390955324067635, 0.47526764935724, -0.2178081667211227], [-1.3390955324067635, -0.47526764935724, 0.2178081667211227]];

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
    