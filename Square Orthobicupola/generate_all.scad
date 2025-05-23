// Auto-generated OpenSCAD file
    shift = 0.01;

    inner_points = 10*[[0.7287883694352655, -0.9622755809862549, 0.4999999999999998], [0.728788369435265, -0.9622755809862551, -0.5000000000000002], [-0.728788369435265, 0.9622755809862551, 0.5000000000000002], [-0.7287883694352655, 0.9622755809862549, -0.4999999999999998], [0.30187402671986113, -0.3985875963849562, 1.2071067811865475], [0.3018740267198599, -0.39858759638495667, -1.2071067811865475], [-0.3018740267198599, 0.39858759638495667, 1.2071067811865475], [-0.30187402671986113, 0.3985875963849562, -1.2071067811865475], [-0.26181395788143796, -0.8255019391003613, 0.5000000000000002], [0.8655620113211595, 0.02832674633044846, 0.49999999999999956], [-0.2618139578814384, -0.8255019391003613, -0.4999999999999998], [0.8655620113211591, 0.028326746330448405, -0.5000000000000004], [-0.8655620113211591, -0.028326746330448405, 0.5000000000000004], [0.2618139578814384, 0.8255019391003613, 0.4999999999999998], [-0.8655620113211595, -0.02832674633044846, -0.49999999999999956], [0.26181395788143796, 0.8255019391003613, -0.5000000000000002]];

    outer_points_unshifted = 10*[[-0.5696478499849842, -0.4314281054603697, -1.093836321399554], [-0.960592326979208, 0.4314281054603697, -0.7734590825338425], [0.960592326979208, -0.4314281054603697, 0.7734590825338425], [0.5696478499849842, 0.4314281054603697, 1.093836321399554], [0.1549886117537691, -1.0415595833913545, -0.7734590782057024], [-0.7888348467405426, 1.0415595833913545, -3.0604573320047734e-09], [0.7888348467405426, -1.0415595833913545, 3.0604573320047734e-09], [-0.1549886117537691, 1.0415595833913545, 0.7734590782057024], [-0.5933626113683385, -0.7888348480349219, -0.16018861993246514], [0.3504608533757889, -0.07402136288581751, -0.9336477001994059], [-0.9843070883625624, 0.07402136288581751, 0.1601886189332462], [-0.04048362361843505, 0.7888348480349219, -0.6132704613336946], [0.04048362361843505, -0.7888348480349219, 0.6132704613336946], [0.9843070883625624, -0.07402136288581751, -0.1601886189332462], [-0.3504608533757889, 0.07402136288581751, 0.9336477001994059], [0.5933626113683385, 0.7888348480349219, 0.16018861993246514]];
    outer_points = [for (p = outer_points_unshifted) [p[0], p[1], p[2] + shift]];
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
    // color([0, 1, 0, 1]) outer_minus_AllTranslationInner(); // Opaque green
    // color([1, 1, 0, 1]) outer_minus_inner_diff(); // Opaque yellow
    