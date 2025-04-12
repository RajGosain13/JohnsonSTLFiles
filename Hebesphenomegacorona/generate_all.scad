// Auto-generated OpenSCAD file

    inner_points = 10*[[0.09531931272834022, -0.708217768074746, 0.49999999999998035], [-0.1265027432556592, 0.7082076393294248, 0.5000000000000197], [0.09531931272830348, -0.7082177680747239, -0.5000000000000197], [-0.12650274325569594, 0.7082076393294469, -0.49999999999998035], [-0.9026819541698768, -0.6450238500956094, 0.5000000000000183], [-1.057403067527742, 0.34293433580159893, 0.5000000000000459], [-0.9026819541699135, -0.6450238500955873, -0.4999999999999816], [-1.0574030675277786, 0.3429343358016208, -0.4999999999999542], [-0.36429558422672353, -0.054614512027756246, 1.1012960420472895], [-0.36429558422680436, -0.054614512027707784, -1.1012960420472664], [0.5881683563647194, 0.09454795600494201, 0.8356590717223468], [0.5881683563646581, 0.09454795600497881, -0.835659071722387], [0.8901105540161008, -0.36426009223040756, -4.1278652498751285e-14], [0.7353894406582356, 0.6236980936668005, -1.3844723451608184e-14]];

    outer_points = 10*[[-0.02066955875502509, 0.7082734695712609, -0.5116521782007974], [0.19691489843267096, -0.7082734695712609, -0.47269409229648607], [-0.19691489843267096, 0.7082734695712609, 0.47269409229648607], [0.02066955875502509, -0.7082734695712609, 0.5116521782007974], [-0.9371950219503415, 0.34351113745696893, -0.6757543304875785], [-0.7854296381335247, -0.6445318169533729, -0.6485810252963166], [-1.1134403616279873, 0.34351113745696893, 0.308591940009705], [-0.9616749778111705, -0.6445318169533729, 0.33576524520096696], [-0.14917650894770007, -0.05441805639996789, -1.145519356688417], [-0.537373098980239, -0.05441805639996789, 1.022593946716898], [0.7416409844661176, 0.09422163776851929, -0.7161588615966802], [0.4470789505652881, 0.09422163776851929, 0.9289969197175875], [0.7395623441727243, 0.6232908947450454, 0.13241724022144047], [0.891327727989541, -0.36475205966529645, 0.15959054541270243]];

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
    