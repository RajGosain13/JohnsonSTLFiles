// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.9849058201924669, 0.8585262410125142, 1.2071067811863656], [-1.528785757453395, -0.759623373893002, -0.49999999999996925], [-0.7596233738762859, 1.5287857574549684, 0.4999999999997299], [-1.3035033111372138, -0.08936385745054792, -1.207106781186605], [1.3035033111553536, 0.08936385743535108, 1.207106781186605], [0.7596233738944258, -1.528785757470165, -0.4999999999997299], [1.5287857574715347, 0.7596233738778053, 0.49999999999996925], [0.9849058202106068, -0.8585262410277109, -1.2071067811863656], [-1.3035033111373446, -0.08936385745018655, 1.2071067811864902], [-1.5287857574534491, -0.7596233738928524, 0.5000000000000306], [-0.7596233738762316, 1.5287857574548187, -0.50000000000027], [-0.9849058201923361, 0.8585262410121528, -1.2071067811867295], [0.984905820210476, -0.8585262410273495, 1.2071067811867295], [0.7596233738943715, -1.5287857574700154, 0.50000000000027], [1.5287857574715888, 0.7596233738776557, -0.5000000000000306], [1.3035033111554843, 0.0893638574349897, -1.2071067811864902], [-0.4739450492223731, 0.159298745465096, 1.707106781186498], [-1.0178249864833009, -1.4588508694404203, 1.6314155227994063e-13], [0.06993488803873991, 1.7774483603701012, -2.6229591075641936e-13], [-0.4739450492221878, 0.15929874546458486, -1.707106781186597], [0.4739450492403277, -0.1592987454797817, 1.707106781186597], [-0.06993488802060001, -1.777448360385298, 2.6229591075641936e-13], [1.0178249865014406, 1.4588508694252236, -1.6314155227994063e-13], [0.47394504924051306, -0.15929874548029285, -1.707106781186498], [-0.23902080233061446, 1.5083023029927278, 1.353553390593035], [-1.1014982305363656, -1.0577374103756392, -1.3535533905931754], [1.1014982305545054, 1.0577374103604424, 1.3535533905931754], [0.2390208023487544, -1.5083023030079246, -1.353553390593035], [0.27193996863947956, 0.8090748074453095, 1.8535533905931674], [-0.5905374595662716, -1.7569649059230572, -0.8535533905930429], [0.5905374595844115, 1.7569649059078605, 0.8535533905930429], [-0.2719399686213396, -0.8090748074605062, -1.8535533905931674]];

    outer_points = 10*[[-0.8446900511180744, 1.3030414766726957, -0.867637706641361], [-1.5597798480580507, -0.8536041736719377, -0.05157812186332089], [-0.25595636104042685, 0.8536041736719377, -1.5394998597940455], [-0.9710461579804031, -1.3030414766726957, -0.7234402750160054], [0.9710461579804031, 1.3030414766726957, 0.7234402750160054], [0.25595636104042685, -0.8536041736719377, 1.5394998597940455], [1.5597798480580507, 0.8536041736719377, 0.05157812186332089], [0.8446900511180744, -1.3030414766726957, 0.867637706641361], [-1.470432588051366, 0.9891747549732535, -0.15354110359529327], [-1.7666324802585267, 0.0958628773675625, 0.18448184412432744], [-0.04910372883995073, -0.0958628773675625, -1.7755598257816938], [-0.34530362104711143, -0.9891747549732535, -1.437536878062073], [0.34530362104711143, 0.9891747549732535, 1.437536878062073], [0.04910372883995073, 0.0958628773675625, 1.7755598257816938], [1.7666324802585267, -0.0958628773675625, -0.18448184412432744], [1.470432588051366, -0.9891747549732535, 0.15354110359529327], [-0.7291708128859692, 1.6208416413427247, 0.07345652930633434], [-1.4442606098259454, -0.5358040090019087, 0.8895161140843744], [0.692158046325446, 0.5358040090019087, -1.5485621928800661], [-0.022931750614530233, -1.6208416413427247, -0.732502608102026], [0.022931750614530233, 1.6208416413427247, 0.732502608102026], [-0.692158046325446, -0.5358040090019087, 1.5485621928800661], [1.4442606098259454, 0.5358040090019087, -0.8895161140843744], [0.7291708128859692, -1.6208416413427247, -0.07345652930633434], [0.03517302803740674, 1.7099897115417881, -1.113064062349067], [-1.098806673635385, -1.7099897115417881, 0.18103215948739226], [1.098806673635385, 1.7099897115417881, -0.18103215948739226], [-0.03517302803740674, -1.7099897115417881, 1.113064062349067], [0.15069226626951202, 2.027789876211817, -0.17196982640137165], [-0.9832874354032798, -1.392189546871759, 1.122126395435088], [0.9832874354032798, 1.392189546871759, -1.122126395435088], [-0.15069226626951202, -2.027789876211817, 0.17196982640137165]];

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
    