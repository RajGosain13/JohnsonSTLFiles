// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.9987270749614695, -0.364205811638524, -0.4436890860803185], [0.9991182313764295, -0.36420581163853794, -0.35087673806764436], [-0.4844601077687184, 0.4409094125179242, -0.7391869071989888], [-0.5140713889852709, -1.1693210357949793, -0.10178509095531102], [0.5144625454002312, 0.4409094125179172, -0.6927807331926518], [0.4848512641836786, -1.1693210357949864, -0.055378916948973976], [-0.8932613027512826, 0.41583146142721766, 0.17309193139693055], [-0.9103573839327088, -0.513835521363569, 0.5410960415871743], [0.8369234853688419, 0.41583146142720556, 0.25346978256078845], [0.8198274041874156, -0.5138355213635811, 0.6214738927510323], [-0.019620868100507078, 0.8806649528226049, 0.029278801883737618], [-0.0538130304633598, -0.9786690127589686, 0.7652870222642252], [-0.46897543145439324, -0.933375714707972, -1.0725044943214548], [0.5299472217145562, -0.9333757147079789, -1.0260983203151177], [0.04529153573835777, -0.12826049055152355, -1.3680023154401253]];

    outer_points = 10*[[-0.9998038282183614, -0.36459847125866063, -0.22466188312211807], [1.0001954063490741, -0.36459847125866063, -0.22291210322967533], [-0.499158278691538, 0.08842950542533667, -0.9623065713566289], [-0.500449760461467, -0.8176264479426579, 0.513857695058614], [0.5008413385921798, 0.08842950542533667, -0.9614316814104075], [0.4995498568222507, -0.8176264479426579, 0.5147325850048354], [-0.8658480427340112, 0.626154295547598, -0.20310260203452007], [-0.8665936800815331, 0.10304264696972326, 0.6491612345484268], [0.8662021019508204, 0.626154295547598, -0.20158724819663343], [0.8654564646032984, 0.10304264696972326, 0.6506765883863135], [0.0005498482821656634, 0.8877101198365354, -0.6284768434070501], [-0.0009414264128783963, -0.1585131773192141, 1.0760508297588436], [-0.4996455845307593, -1.2114785717593914, -0.4053157694550875], [0.5003540327529584, -1.2114785717593914, -0.4044408795088661], [0.0009999649960640952, -0.7584505950753941, -1.1429604576895982]];

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
    