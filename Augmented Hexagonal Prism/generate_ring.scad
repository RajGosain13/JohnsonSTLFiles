// Auto-generated OpenSCAD file

    inner_points = 10*[[0.5272841921394986, -0.8941494324725834, -0.5000000000002047], [1.0157495787801158, -0.02156616077066012, -0.5000000000002183], [-0.9840743682826907, -0.048102565072366016, 0.5000000000002183], [-0.49560898164207345, 0.8244807066295572, 0.5000000000002047], [-0.22839508807181572, -0.47112599877236716, -0.9999999999999931], [0.5272841921397184, -0.8941494324726909, 0.4999999999997952], [0.2600702985688014, 0.401457272929556, -1.0000000000000067], [1.0157495787803354, -0.021566160770767534, 0.49999999999978156], [-0.9840743682829104, -0.0481025650722586, -0.49999999999978156], [-0.22839508807137623, -0.4711259987725822, 1.0000000000000067], [-0.4956089816422933, 0.8244807066296647, -0.4999999999997952], [0.26007029856924085, 0.4014572729293411, 0.9999999999999931], [-0.6705068091423759, 0.3493759475629592, -1.3623724356956024]];

    outer_points = 10*[[-0.5871016774818598, -0.035032029076049194, -0.9508335170979203], [-1.1127273597817333, 0.035032029076049194, -0.10300766831643143], [1.1127273597817333, -0.035032029076049194, 0.10300766831643143], [0.5871016774818598, 0.035032029076049194, 0.9508335170979203], [-0.1941165129402417, -0.8989291704166398, -0.6358027414048893], [-0.1301723233916815, 0.8288651122645414, -0.7389437000837753], [-0.7197421952401151, -0.8288651122645414, 0.21202310737659946], [-0.6557980056915549, 0.8989291704166398, 0.10888214869771351], [0.6557980056915549, -0.8989291704166398, -0.10888214869771351], [0.7197421952401151, 0.8288651122645414, -0.21202310737659946], [0.1301723233916815, -0.8288651122645414, 0.7389437000837753], [0.1941165129402417, 0.8989291704166398, 0.6358027414048893], [-0.05807720084257707, -1.5692662035184195, 0.09367759939690216]];

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
    