// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.44338942496134576, -0.5631291440797384, 0.736853897056677], [0.258799636920154, 0.14397761227363534, 0.8201038609809336], [-0.25879980510935924, 0.14397747926995844, -0.8201039287466986], [0.44338919068963584, -0.5631293267497549, -0.7368538292909121], [-0.4284186803233596, -0.6653657601513122, -0.2577935536208068], [0.47682137191431595, 0.24621402912054582, -0.1504703186366988], [-0.47682153054903015, 0.24621410252250395, 0.15047023127520603], [0.42841843649715877, -0.6653657507776369, 0.25779364098229957]];

    outer_points = 10*[[0.4999998558605856, -0.7822559369703687, 0.051219988111338946], [-0.5000001441354547, -0.7822559369703687, 0.05121717394836035], [1.5482124809305407e-06, 0.7495881473432447, -0.5501502552287388], [-1.259937611829569e-06, 0.8149237265974926, 0.4477130931690396], [0.6445843110171734, 0.20512235240503623, -0.01342867001218147], [-0.6445842354260318, 0.20512235240503623, -0.013432297942578041], [1.7722938158523331e-06, -0.2472366392743148, -0.629776537226624], [-1.8478849574399043e-06, -0.16300806553575767, 0.6566375051813835]];

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
    color([1, 1, 0, 1]) outer_minus_inner_diff(); // Opaque yellow
    