// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.12531678041950284, -1.3574519535518534, -0.3000260109199145], [-0.36746057341550314, 0.8957867730802842, 1.0108452987700864], [0.3981645779138779, -0.8876613539251546, -1.0108452987700864], [0.15602078491787758, 1.3655773727069829, 0.3000260109199145], [1.1703376344459069, -0.6833157024764185, 0.39628853077487575], [1.0778469356862532, 0.17734490632952513, 0.8969968161993667], [-1.0471429311878786, -0.16921948717439553, -0.8969968161993667], [-1.1396336299475323, 0.6914411216315481, -0.39628853077487575], [-0.2463928887078073, -0.7090848095102253, 1.1774700504213524], [1.1240990998859461, 0.520842947907666, -0.6834790050293927], [-1.0933950953875715, -0.5127175287525364, 0.6834790050293927], [0.277096893206182, 0.717210228665355, -1.1774700504213524], [0.3519124137141851, -1.2311593955032956, 0.5696305224586731], [0.20225931947783818, 0.16141872232289847, 1.379793546724183], [1.198923043974558, -0.47102223771210283, -0.5804992451419002], [1.0492699497382112, 0.9215558801140912, 0.2296637791236098], [-1.0185659452398366, -0.9134304609589615, -0.2296637791236098], [-1.1682190394761833, 0.4791476568672325, 0.5804992451419002], [-0.17155531497946344, -0.15329330316776887, -1.379793546724183], [-0.32120840921581034, 1.239284814658425, -0.5696305224586731], [0.7452968962209774, -0.6746243016514798, 1.3014210240601998], [-1.6168689194414103, -0.1269845502290076, -0.0762480675498447], [0.8250174408462159, -0.08256874217359109, -1.4226978450891705]];

    outer_points = 10*[[-0.4278051408840869, 1.2127161463312635, -0.5566217759152233], [-0.17380580954418245, -1.3719247336384077, -0.2261405699168037], [0.17380580954418245, 1.3719247336384077, 0.2261405699168037], [0.4278051408840869, -1.2127161463312635, 0.5566217759152233], [0.9893779464124436, 0.49362248371798856, -0.8608098595411191], [1.0863970578645408, -0.49362248371798856, -0.7345772714927785], [-1.0863970578645408, 0.49362248371798856, 0.7345772714927785], [-0.9893779464124436, -0.49362248371798856, 0.8608098595411191], [-0.3910812087944938, -0.20840674643547916, -1.3293410426713064], [1.1839567074308435, 0.20840674643547916, 0.7199573838305398], [-1.1839567074308435, -0.20840674643547916, -0.7199573838305398], [0.3910812087944938, 0.20840674643547916, 1.3293410426713064], [0.07624615997787965, 0.6698955034849399, -1.2283940854065145], [0.233226379865687, -0.9275004090487542, -1.0241454674564356], [1.0496731257749474, 0.9275004090487542, 0.038141995263304695], [1.2066533456627548, -0.6698955034849399, 0.24239061321338368], [-1.2066533456627548, 0.6698955034849399, -0.24239061321338368], [-1.0496731257749474, -0.9275004090487542, -0.038141995263304695], [-0.233226379865687, 0.9275004090487542, 1.0241454674564356], [-0.07624615997787965, -0.6698955034849399, 1.2283940854065145], [0.5871367924966472, -0.13720650167138226, -1.5243283937879823], [-1.624077516255638, -0.13720650167138226, 0.17515389348918065], [0.7552912676752325, 1.0728158516403192, 0.9827174256902117]];

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
    