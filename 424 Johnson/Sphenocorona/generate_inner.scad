// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.49475772011132046, 0.003839472954238088, 0.8557705860181677], [0.505223446776251, 0.0038995730095640058, 0.8496336276384451], [-0.505223446776251, -0.0038995730095640058, -0.8496336276384451], [0.49475772011132046, -0.003839472954238088, -0.8557705860181677], [0.003137871696801686, -0.788661439733275, 0.5035742160091927], [-0.002998750789873661, -0.7931992616167778, -0.49639665858516746], [-0.5000365230269928, 0.5223214995430275, 0.0006983537803530961], [0.4999446438605786, 0.5223815995983536, -0.00543860459936947], [-0.789374516264686, -0.4348859382371884, 0.006817726903340358], [0.7894510022985628, -0.43479104894911214, -0.0028716420739015092]];

    outer_points = 10*[[0.8526836986618631, 0.4907220093236373, 0.09625829137218865], [0.8527700142393673, -0.4907220093236373, -0.09549058296899036], [-0.8527700142393673, 0.4907220093236373, 0.09549058296899036], [-0.8526836986618631, -0.4907220093236373, -0.09625829137218865], [0.49965051582430237, -0.15166158156646264, 0.7764868514685156], [-0.5003493828586203, -0.15166158156646264, 0.7760367024438842], [0.00018761744828893297, 0.5908833725510971, -0.4167895941433019], [0.00027393302579300583, -0.3905606460961775, -0.6085384684844809], [-0.0002602518163823537, 0.6913983635916522, 0.578145848983155], [-0.0001239720133965481, -0.8581596810908002, 0.27540213141105363]];

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
    