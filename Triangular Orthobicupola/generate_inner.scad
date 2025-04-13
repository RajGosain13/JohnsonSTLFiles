// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.42241592184244553, -0.3935709876343616, 0.8164965809276301], [0.552050434404801, -0.1690374254610991, 0.8164965809279018], [-0.1296345125630803, 0.5626084130956421, 0.8164965809276461], [0.5520504344052842, -0.16903742546121997, -0.8164965809275502], [-0.29278140927936525, -0.9561794007300037, -1.5987211554602254e-14], [0.29278140927936525, 0.9561794007300037, 1.5987211554602254e-14], [-0.42241592184196236, -0.3935709876344824, -0.816496580927822], [0.6816849469678814, -0.7316458385567411, 2.5579538487363607e-13], [-0.6816849469678814, 0.7316458385567411, -2.5579538487363607e-13], [-0.12963451256259706, 0.5626084130955212, -0.816496580927806], [-0.9744663562472466, -0.22453356217326248, -2.7176669244139555e-13], [0.9744663562472466, 0.22453356217326248, 2.7176669244139555e-13]];

    outer_points = 10*[[0.1279020562557553, -0.9484628204349614, 0.2899298919706412], [0.5177054037875468, -0.6332250521206378, -0.5753322068648584], [0.9027667961251077, -0.3163375745111199, 0.2914492250228672], [-0.5145441003247264, 0.6321252459238417, -0.5793634802839585], [-0.7748647398693524, -0.6321252459238417, -0.001519333052226013], [0.7748647398693524, 0.6321252459238417, 0.001519333052226013], [-0.904347447856518, 0.316887477609518, 0.2858986185515415], [-0.38506139233756087, -0.316887477609518, -0.8667814318877258], [0.38506139233756087, 0.316887477609518, 0.8667814318877258], [-0.12948270798716557, 0.9490127235333596, 0.28741795160376743], [-0.3898033475317915, -0.31523776831432365, 0.8652620988354998], [0.3898033475317915, 0.31523776831432365, -0.8652620988354998]];

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
    