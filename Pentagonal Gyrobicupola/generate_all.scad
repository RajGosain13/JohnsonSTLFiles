// Auto-generated OpenSCAD file

    inner_points = 10*[[-1.3196803278726468, 0.9362046957981746, -6.595639077981762e-13], [1.3196795770729461, -0.9362042464911885, 6.595639077981762e-13], [-0.5584491756654331, 1.4751697470422118, -0.3606158710418413], [1.5768378417073974, -0.039640907689503124, -0.360615871040774], [-1.576838592507098, 0.039641356996489185, 0.360615871040774], [0.5584484248657327, -1.4751692977352255, 0.3606158710418413], [0.41609043726663214, 1.4506701799017077, -0.5834887362276886], [1.231697502166666, 0.8720639963146739, -0.583488736227281], [-1.2316982529663667, -0.8720635470076878, 0.583488736227281], [-0.41609118806633266, -1.4506697305947214, 0.5834887362276886], [0.3400958061980706, 0.4794020290670393, -0.8090169943749945], [-0.34009655699777114, -0.47940157976005326, 0.8090169943749945], [-0.6344438067339944, 0.5039015962075438, -0.5861441291891473], [0.685236145738802, -0.43230287493713776, -0.5861441291884877], [-0.6852368965385024, 0.4323033242441238, 0.5861441291884877], [0.634443055934294, -0.5039011469005578, 0.5861441291891473], [0.07599425566871129, 0.9712683754881611, 0.22552825814730598], [0.8916013205687453, 0.3926621919011276, 0.22552825814771355], [-0.8916020713684457, -0.39266174259414155, -0.22552825814771355], [-0.07599500646841176, -0.9712679261811751, -0.22552825814730598]];

    outer_points = 10*[[0.38730796483642055, 0.32816512550448207, 1.536337911895294], [-0.38730796483642055, -0.32816512550448207, -1.536337911895294], [1.122601014421019, -0.22411714494778695, 1.1434913451842328], [0.49592356320214137, -0.7550994719364139, -1.3423556144673943], [-0.49592356320214137, 0.7550994719364139, 1.3423556144673943], [-1.122601014421019, 0.22411714494778695, -1.1434913451842328], [1.4290986323018988, -0.6907942834915881, 0.3138699504541333], [1.189729145919442, -0.8936114849757331, -0.6356390973021997], [-1.189729145919442, 0.8936114849757331, 0.6356390973021997], [-1.4290986323018988, 0.6907942834915881, -0.3138699504541333], [0.9696619025702452, 0.0, -0.24444998405369595], [-0.9696619025702452, 0.0, 0.24444998405369595], [0.6631642846893652, 0.46667713854380116, 0.5851714106764037], [0.2758563198529447, 0.1385120130393191, -0.9511665012188903], [-0.2758563198529447, -0.1385120130393191, 0.9511665012188903], [-0.6631642846893652, -0.46667713854380116, -0.5851714106764037], [0.45943672973165367, -0.6907942834915881, 0.5583199345078292], [0.2200672433491967, -0.8936114849757331, -0.3911891132485038], [-0.2200672433491967, 0.8936114849757331, 0.3911891132485038], [-0.45943672973165367, 0.6907942834915881, -0.5583199345078292]];

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
    