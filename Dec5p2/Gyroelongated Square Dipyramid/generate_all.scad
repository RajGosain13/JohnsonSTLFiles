// Auto-generated OpenSCAD file

    inner_points = 10*[[0.28049451672543285, 0.7867345754664719, -0.4354727591501641], [-0.32516147561098985, -0.49081979957517285, -0.40329143290440955], [0.6146891757185167, -0.15523991749246438, -0.467063652066502], [-0.6593561346040736, 0.45115469338376324, -0.3717005399880716], [0.7016700222556713, 0.3782028432350707, 0.37428832740645657], [-0.1992160562123516, 0.806988584660629, 0.4417202306321675], [0.27340656300831917, -0.5251645186914181, 0.39704396142240617], [-0.6274795154597037, -0.09637877726585975, 0.4644758646481171], [-0.0723068878516462, 0.15388180167658133, -1.1246958983691562], [0.08706866180685142, 0.13498761925367364, 1.1246958983691562]];

    outer_points = 10*[[0.17620995754639138, 0.41987517424097626, -0.6851507748037986], [-0.13338679414034935, 0.41987517424097626, 0.6947585886491126], [-0.6676027533643164, 0.4567802144980838, -0.14978349254876247], [0.7104259167703585, 0.3829701339838687, 0.15939130639407634], [-0.3991593090883643, -0.393779370015213, -0.6019853395350742], [0.5752541082333443, -0.4459709784667395, -0.3833657426306054], [-0.6180772716393863, -0.393779370015213, 0.37375792878529157], [0.35633614568232225, -0.4459709784667395, 0.5923775256897603], [0.05742142630098579, 1.1260182319875078, 0.01288308314360636], [-0.05742142630098579, -1.1260182319875078, -0.01288308314360636]];

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
    