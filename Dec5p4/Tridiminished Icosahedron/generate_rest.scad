// Auto-generated OpenSCAD file

    inner_points = 10*[[0.20054969961687025, -0.7846648703547799, 0.5607849288864212], [-0.593825213987971, -0.18515141359460924, -0.7149838983501856], [0.6259312435012088, 0.10711605562361853, 0.7149838983501856], [-0.16844367010363231, 0.7066295123837892, -0.5607849288864212], [0.05204957726190045, -0.8903315309220826, -0.42246593966397755], [0.7403313734536651, 0.5526003178298201, -0.17296676604139943], [-0.35354696868411156, -0.01417916531901519, 0.8759494264322145], [-0.8444976651021647, 0.3563405276717107, 0.08748092941239895], [0.3856529981973495, -0.06385619265197554, -0.8759494264322145]];

    outer_points = 10*[[0.05186484528504093, -0.5598217429238111, 0.7670841877921737], [0.7499238660434013, 0.5598217429238111, -0.16947657205566397], [-0.7499238660434013, -0.5598217429238111, 0.16947657205566397], [-0.05186484528504093, 0.5598217429238111, -0.7670841877921737], [0.44189511281724014, 0.3609594235595834, 0.7608846831151523], [-0.8554262739081575, 0.3609594235595834, -0.20606475108230704], [0.11884163653508852, -0.9300334806470967, -0.15944556277482932], [0.5502658375172237, -0.23805575111085425, -0.7382719448902207], [-0.11884163653508852, 0.9300334806470967, 0.15944556277482932]];

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
    