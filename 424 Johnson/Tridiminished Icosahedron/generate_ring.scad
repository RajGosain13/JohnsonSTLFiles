// Auto-generated OpenSCAD file

    inner_points = 10*[[0.5357591741651873, -0.543383530882565, 0.5676309916995522], [-0.5731986516605712, -0.45512777948624156, -0.6072977089606933], [0.5731986515218852, 0.45512777955762335, 0.6072977089606933], [-0.5357591743038732, 0.5433835309539468, -0.5676309916995522], [0.3333250709014692, -0.8078126191713554, -0.3752887774762634], [0.3939034177856385, 0.8078126192720669, -0.31110668072560493], [-0.2456533920977693, -0.027272527020831643, 0.9183785262299818], [-0.9310270205482738, 0.02727252704475715, 0.19223265486419908], [0.24565339195908334, 0.027272527092213467, -0.9183785262299818]];

    outer_points = 10*[[-0.3333250709381238, 0.8078126192179577, -0.37528877748181], [-0.39390341794565986, -0.8078126192179577, -0.31110668065861835], [0.39390341794565986, 0.8078126192179577, 0.31110668065861835], [0.3333250709381238, -0.8078126192179577, 0.37528877748181], [-0.9310270204929976, 0.027272527075261566, -0.19223265478667906], [0.24565339210818965, 0.027272527075261566, 0.9183785262080897], [0.5731986515762008, 0.45512777945089933, -0.6072977090281112], [0.5357591741432581, -0.5433835309846493, -0.5676309917221422], [-0.5731986515762008, -0.45512777945089933, 0.6072977090281112]];

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
    