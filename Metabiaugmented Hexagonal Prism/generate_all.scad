// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.0056399232151652795, -0.3360917085536317, -0.9999999999999865], [-0.004821322839871758, 0.663907956393025, -1.0000000000000135], [-0.005639923215391682, -0.3360917085535774, 1.0000000000000135], [-0.004821322840098161, 0.6639079563930792, 0.9999999999999865], [-0.8716650368349537, -0.3353827798330664, -0.5000000000000846], [0.8603851904045097, -0.33680063727416976, -0.4999999999998884], [-0.8708464364596602, 0.6646168851135902, -0.5000000000001116], [0.8612037907798034, 0.6631990276724868, -0.49999999999991546], [-0.8716650368350669, -0.3353827798330393, 0.49999999999991546], [0.8603851904043966, -0.33680063727414267, 0.5000000000001116], [-0.8708464364597732, 0.6646168851136173, 0.4999999999998884], [0.8612037907796903, 0.6631990276725139, 0.5000000000000846], [-0.7917964519713716, 0.1645520072181886, -1.3623724356958835], [-0.7917964519716802, 0.16455200721826255, 1.3623724356957054]];

    outer_points = 10*[[-1.0060843799292358, -0.34733073917718565, 0.3422799703240538], [-0.9936151164744732, 0.34733073917718565, -0.3769487470944146], [0.9936151164744732, -0.34733073917718565, 0.3769487470944146], [1.0060843799292358, 0.34733073917718565, -0.3422799703240538], [-0.5165877783212961, 0.27563320269095287, 0.9524512611485145], [-0.49573123333532093, -0.9702946810453241, -0.2505569321152264], [-0.5041185148665335, 0.9702946810453241, 0.233222543730046], [-0.4832619698805584, -0.27563320269095287, -0.969785649533695], [0.4832619698805584, 0.27563320269095287, 0.969785649533695], [0.5041185148665335, -0.9702946810453241, -0.233222543730046], [0.49573123333532093, 0.9702946810453241, 0.2505569321152264], [0.5165877783212961, -0.27563320269095287, -0.9524512611485145], [-1.3716391974518345, 0.5658059352223662, 0.5226991745472914], [1.35269627612334, 0.5658059352223662, 0.5699309603985218]];

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
    