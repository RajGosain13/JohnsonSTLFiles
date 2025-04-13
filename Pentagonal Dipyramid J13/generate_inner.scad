// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.7006292682253485, 0.30606485476032513, -6.130120740868102e-13], [0.30689198471783646, 0.005276334587299036, 6.130120740868102e-13], [-0.2720657717976499, -0.09620971856082147, 0.8090169943752502], [-0.27206577179637514, -0.09620971856314678, -0.8090169943746447], [5.5554147393444e-10, 0.8151018158228152, 0.49999999999920747], [5.563293437038652e-10, 0.8151018158213781, -0.5000000000007926], [-0.4402116662866258, -0.6594312211511645, 9.79654968021913e-13]];

    outer_points = 10*[[-3.627212082769728e-05, 5.120611380175485e-06, -0.5257311108429229], [3.627212082769728e-05, -5.120611380175485e-06, 0.5257311108429229], [0.8090169926260806, 0.26286555604709816, -5.325674888357133e-05], [-0.8090169922727908, 0.26286555604709816, 5.837736025155943e-05], [0.4999999983475059, -0.6881909602029435, -4.1199804176948946e-05], [-0.4999999992724306, -0.6881909602029435, 2.779386957237699e-05], [5.716348896531026e-10, 0.8506508083116905, 8.285323236583849e-06]];

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
    