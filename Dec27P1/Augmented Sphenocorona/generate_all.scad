// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.33527340439148867, 0.7498997662519438, 0.4513456021203321], [-0.15430438504244254, -0.1676220498145088, -0.9748300137498693], [0.11133893181382774, 0.024295540843831454, 0.9748300137498693], [0.2923079511628739, -0.8932262752226212, -0.4513456021203321], [-0.7603709966932597, 0.3145903298228517, -0.3422523638391476], [-0.055234763477199314, -0.8310337132952008, 0.4842537494941892], [0.21927979692174981, 0.5152429571411032, -0.3470320834716172], [0.6658921331270662, -0.21036126826700907, 0.17645232815792009], [-0.7772187463952425, -0.14199914567561245, 0.54726559786484], [-0.6711068070064338, -0.679991889873274, -0.28897842364432175], [0.661801140766184, 0.7271720747422719, 0.5243237045707335]];

    outer_points = 10*[[-0.6646630702233576, -0.7303166978819896, -0.04476341064086725], [-0.12860392172681917, 0.7303166978819896, 0.6536373544767964], [0.12860392172681917, -0.7303166978819896, -0.6536373544767964], [0.6646630702233576, 0.7303166978819896, 0.04476341064086725], [-0.8529840806486279, 0.22448007402066417, 0.18523294019252518], [0.39946967687864576, 0.22448007402066417, -0.7760908846435595], [-0.12424046378929937, -0.2696576228647949, 0.6593222539336372], [0.6690265281608774, -0.2696576228647949, 0.05044831009770817], [-0.5696102969148841, -0.01991608581139187, -0.7421126349582734], [-0.2552897790787969, 0.8365323986755415, -0.33260243302517273], [0.20051337790222834, -1.1275989896931966, 0.26123739691040415]];

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
    