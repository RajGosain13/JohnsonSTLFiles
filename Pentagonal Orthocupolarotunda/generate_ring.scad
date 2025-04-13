// Auto-generated OpenSCAD file

    inner_points = 10*[[3.624317002584078e-13, 2.953319001906976e-13, 1.618033988749895], [-3.624317002584078e-13, -2.953319001906976e-13, -1.618033988749895], [1.4067368092917045, -0.799453274515584, -1.6918183476653185e-13], [0.799453274515584, 1.4067368092917045, -4.358384739871853e-13], [-0.4563237566115435, 0.834432217941957, 1.3090169943748973], [-0.45632375661213, 0.8344322179414793, -1.3090169943749976], [0.45632375661213, -0.8344322179414793, 1.3090169943749976], [0.4563237566115435, -0.834432217941957, -1.3090169943748973], [0.9504130526801611, 0.03497894342637298, 1.309016994374728], [0.9504130526795745, 0.03497894342589519, -1.3090169943751668], [-0.7383473480718745, 1.350139689937751, 0.49999999999991895], [-0.7383473480720981, 1.3501396899375684, -0.500000000000081], [0.7383473480720981, -1.3501396899375684, 0.500000000000081], [0.7383473480718745, -1.350139689937751, -0.49999999999991895], [1.5378006225876821, 0.056597119354135916, 0.4999999999996452], [1.5378006225874585, 0.056597119353953396, -0.5000000000003548], [0.21206570460806262, 1.3851186333639414, 0.8090169943746471], [0.21206570460770024, 1.3851186333636463, -0.8090169943752478], [1.0814768659759149, 0.8910293372959104, 0.8090169943745426], [1.0814768659755525, 0.8910293372956152, -0.8090169943753523], [-0.8694111613678522, 0.49408929606803104, 1.0456012416478531e-13], [-0.5873875699075214, -0.02161817592776291, 0.809016994375083], [-0.5873875699078839, -0.021618175928058286, -0.8090169943748119], [-0.13106381329575384, -0.8560503938695374, 0.5000000000001856], [-0.13106381329597788, -0.8560503938697199, -0.49999999999981437]];

    outer_points = 10*[[-0.4827045868491299, -0.5943615441771533, -1.4253998124694895], [0.4827045868491299, 0.5943615441771533, 1.4253998124694895], [1.5325422089871936, 0.0, -0.5189878287807413], [0.19064272411334998, -1.5049147296618652, 0.56295736689317], [-1.097875476912321, -0.9458928165929492, -0.7197153641977476], [-0.31684304886495324, 0.01580436349155695, 1.5866299799356127], [0.31684304886495324, -0.01580436349155695, -1.5866299799356127], [1.097875476912321, 0.9458928165929492, 0.7197153641977476], [0.43466673207487266, -0.9458928165929492, -1.2387031929784889], [1.2156991601222404, 0.01580436349155695, 1.0676421511548713], [-1.2936952502100056, -0.9361251827846091, 0.2608758909720249], [-0.9953674090117679, -0.5687895468772561, 1.1418214226358954], [0.9953674090117679, 0.5687895468772561, -1.1418214226358954], [1.2936952502100056, 0.9361251827846091, -0.2608758909720249], [1.186010133125118, -0.9361251827846091, -0.5788640557427255], [1.4843379743233558, -0.5687895468772561, 0.3020814759211451], [-0.5607006769368953, -1.5146823634702054, -0.09688177034259327], [-0.07799609008776537, -0.9203208192930521, 1.3285180421268963], [0.38646249741103483, -1.5146823634702054, -0.4176338882766023], [0.8691670842601649, -0.9203208192930521, 1.0077659241928874], [-0.9471631743479302, 0.0, 0.32075211793400904], [-0.7513434010502453, -0.009767633808340115, -0.6598391372357633], [-0.26863881420111535, 0.5845939103688131, 0.7655606752337263], [0.04820423466383783, 0.5687895468772561, -0.8210693047018864], [0.34653207586207563, 0.9361251827846091, 0.059876226961984164]];

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
    