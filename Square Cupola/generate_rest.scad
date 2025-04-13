// Auto-generated OpenSCAD file

    inner_points = 10*[[0.3549004973467511, -0.35521054808402747, -1.2071067811864837], [-0.30136407955047917, 0.39932030291538634, -1.2071067811866112], [0.3549004973463955, -0.3552105480839295, 1.2071067811866112], [-0.3013640795508348, 0.3993203029154843, 1.2071067811864837], [0.818949629923199, -0.8887444294401406, -0.4999999999998463], [-0.7654132121271353, 0.9328541842715569, -0.5000000000001537], [0.8189496299230516, -0.8887444294401, 0.5000000000001537], [-0.7654132121272826, 0.9328541842715975, 0.4999999999998463], [-0.178633384009495, -0.8192596806605508, -0.4999999999999961], [-0.8348979609067254, -0.06472882966113712, -0.5000000000001235], [-0.17863338400964232, -0.8192596806605101, 0.5000000000000039], [-0.8348979609068726, -0.06472882966109651, 0.49999999999987654]];

    outer_points = 10*[[1.2307668032340542, 0.4303553059775063, 0.08434552661867156], [1.0919099787017486, -0.4303553059775063, 0.574137344382946], [-1.0919099787017486, 0.4303553059775063, -0.574137344382946], [-1.2307668032340542, -0.4303553059775063, -0.08434552661867156], [0.6486571265504295, 1.0389696163301188, -0.4548547567133196], [0.3134270975364759, -1.0389696163301188, 0.7276072924725627], [-0.3134270975364759, 1.0389696163301188, -0.7276072924725627], [-0.6486571265504295, -1.0389696163301188, 0.4548547567133196], [0.3844694278615675, 0.7903395017889528, 0.47701858554126475], [0.24561260332926171, -0.07037111016605979, 0.9668104033055391], [-0.577614796225338, 0.7903395017889528, 0.20426604978202156], [-0.7164716207576437, -0.07037111016605979, 0.6940578675462961]];

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
    