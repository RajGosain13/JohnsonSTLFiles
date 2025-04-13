// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.5679521834680924, 0.3710392408495472, -0.708875678733561], [0.6774959295154908, -0.4922625333758151, -0.14177512924090818], [-1.0679348487285032, 0.2085260495957944, 0.14177512924090818], [0.17751326425508, -0.6547757246295679, 0.708875678733561], [0.010822126776322105, -0.4253965348253418, -0.8841193748434077], [-0.7981668194007837, -0.6883484018941259, 0.4922625450168436], [-0.2589805762752483, 0.796397621522542, 0.14177512737898157], [0.5107486887730253, 0.2628477825031803, 0.49226254200418296], [-0.13145834293776412, -1.0801341053025628, -0.14177512737898157]];

    outer_points = 10*[[-0.8507501659543638, -0.00016416400980563553, 0.42512659922224816], [0.0002222331138788114, 0.00016416400980563553, -0.9510564761622176], [-0.0002222331138788114, -0.00016416400980563553, 0.9510564761622176], [0.8507501659543638, 0.00016416400980563553, -0.42512659922224816], [-0.6880381915718803, -0.49999998970608384, -0.42557250195458624], [0.6881449121452123, -0.49999998970608384, 0.4253999146333339], [-0.26305127181358173, 0.8089155187812519, 0.4254035837408861], [0.2628785942986316, 0.8091184366568306, -0.4251243315890725], [0.26305127181358173, -0.8089155187812519, -0.4254035837408861]];

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
    