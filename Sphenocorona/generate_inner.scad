// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.4553770683985672, 0.816075390462194, -0.02826725120202972], [-0.3492651290097586, 0.27808264626453244, -0.8645112727111914], [0.3062996757811438, -0.4214091552352098, 0.8645112727111914], [0.4124116151699524, -0.9594018994328712, 0.02826725120202972], [0.45789115536956515, 0.630471121507822, -0.3908857929250278], [0.9045034915748815, -0.09513310390029023, 0.13259861870450954], [-0.5386073879474271, -0.026770981308893688, 0.5034118884114294], [-0.43249544855861854, -0.5647637255065552, -0.33283213309773235], [0.28106973038452526, 0.5396015179782265, 0.5891534403817997], [0.44860512332870417, -0.3098111524472321, -0.7311548260368412]];

    outer_points = 10*[[-0.8336003958246909, -0.4282242422434667, 0.3144481157395024], [-0.5192798779886039, 0.4282242422434667, 0.7239583176726031], [0.5192798779886039, -0.4282242422434667, -0.7239583176726031], [0.8336003958246909, 0.4282242422434667, -0.3144481157395024], [0.015816542021752034, -0.40830815643207485, 0.8417945059096876], [0.8090835339719289, -0.40830815643207485, 0.2329205620737586], [-0.42955329110383256, -0.15856661937867184, -0.559640382982223], [-0.11523277326774545, 0.6978818651082617, -0.15013018104912235], [-0.02137609852116739, -0.9005841684864844, -0.02784969457994478], [0.47489050229114943, 0.45162402044515604, 0.6187076390309791]];

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
    