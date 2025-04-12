// Auto-generated OpenSCAD file

    inner_points = 10*[[0.9453936894816409, -0.47289547434939777, -0.19263732612249004], [0.9559597690770948, 0.47047255319654285, 0.13894241174769978], [-0.4527324971708146, -0.18894257072883713, -0.9559510908824418], [-0.44216641757536057, 0.7544254568171036, -0.624371353012252], [0.44216641757536057, -0.7544254568171036, 0.624371353012252], [0.4527324971708146, 0.18894257072883713, 0.9559510908824418], [-0.9559597690770948, -0.47047255319654285, -0.13894241174769978], [-0.9453936894816409, 0.47289547434939777, 0.19263732612249004], [1.0907778029145119, 0.2807812586554431, -0.8336013201880601], [0.22668829900201493, 0.4562738042971726, -1.305355170890352], [-0.22668829900201493, -0.4562738042971726, 1.305355170890352], [-1.0907778029145119, -0.2807812586554431, 0.8336013201880601], [-0.008548137956640611, -0.7632007662346396, -0.2682536429273739], [0.008548137956640611, 0.7632007662346396, 0.2682536429273739]];

    outer_points = 10*[[0.513230909726221, -0.9184428339478712, -0.2180946841600515], [0.4587614600394385, -0.6315952925971899, 0.738331772537947], [0.5396207656457714, 0.6315952925971899, -0.6814728995641832], [0.485151315958989, 0.9184428339478712, 0.27495355713381525], [-0.485151315958989, -0.9184428339478712, -0.27495355713381525], [-0.5396207656457714, -0.6315952925971899, 0.6814728995641832], [-0.4587614600394385, 0.6315952925971899, -0.738331772537947], [-0.513230909726221, 0.9184428339478712, 0.2180946841600515], [1.2987443863455765, -0.47898812303152916, 0.21762097438667488], [1.3150542142620716, 0.47898812303152916, -0.06876251237934862], [-1.3150542142620716, -0.47898812303152916, 0.06876251237934862], [-1.2987443863455765, 0.47898812303152916, -0.21762097438667488], [0.04406671047085817, -0.23206453574737165, -0.7737652573384957], [-0.04406671047085817, 0.23206453574737165, 0.7737652573384957]];

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
    color([0, 1, 0, 1]) outer_minus_AllTranslationInner(); // Opaque green
    color([1, 1, 0, 1]) outer_minus_inner_diff(); // Opaque yellow
    