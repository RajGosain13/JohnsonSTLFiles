// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.45355703407615483, -0.9852604747027949, 1.2442629448836795], [-0.11128666904117222, 0.5835651383085163, -1.565322994036517], [-1.0016741042155215, -0.15000111337832142, 1.287960504788888], [0.1599278591139769, -1.520900805152802, 0.6639822178016064], [-0.7247715622313039, 1.119205468758524, -0.9850422669544439], [0.43683040109819454, -0.25169422301595684, -1.6090205539417255], [-1.2750612603248952, 0.6658365922161982, 0.7783839148588771], [0.604450197740842, -1.5523257042416663, -0.23123416172848094], [-1.1692939008581689, 1.150630367847388, -0.08982588742435665], [0.7102175572075684, -1.0675319286104765, -1.0994439640117146], [-0.07373926097703089, -0.15917918368749281, 1.6605899316050716], [0.5369510310439554, -0.879903803247868, 1.3325451328490563], [0.25177920002421017, 1.3328626384976536, -1.0114850836962188], [0.8624694920451964, 0.6121380189372783, -1.3395298824522341], [-0.5056295914533497, 0.708853913520469, 1.415662831037149], [1.0931783496571914, -1.1780276370174307, 0.5568303980612812], [-0.3044481185890256, 1.6309864722672165, -0.23577034890844362], [1.2943598225215154, -0.2558950782706834, -1.0946027818843114], [-0.5937525335554718, 1.3926363486024174, 0.691317658796271], [1.3824827646236373, -0.9396775133526316, -0.3702576096434335], [-0.8286998825229884, -1.5635001676990283, 0.5197584930665651], [-0.5517973405387707, -0.2942935855621831, -1.7532442786767668], [-1.715571931822494, -0.2120221316545012, 0.5904626302186273], [-1.5444367493050026, 0.5723906748511545, -0.8143303392414709], [-0.10944762986613042, -1.614346722517846, -0.9287320362987417], [-1.608667983638949, -1.0856125902905323, 0.11568767674818647], [-1.4375328011214579, -0.30119978378487644, -1.2891052927119118], [-0.9951830904488174, -1.6212529207405393, -0.4645930503338865], [-0.889415730982091, -1.1364591451093493, -1.3328028526171203], [-1.8820551397483227, -0.2697748846960123, -0.39388891318182445]];

    outer_points = 10*[[-1.2023976649193235, -0.20790108708079238, 1.1467271385135702], [0.5703055554767221, -0.20790108708079238, -1.5606072049684219], [-1.4167473948229383, 0.6253103044559617, 0.6370086178537524], [-0.649491745903262, -1.0411124786175465, 1.139390809023269], [0.01739963646066056, 0.6253103044559617, -1.5532708754781206], [0.7846552853803369, -1.0411124786175465, -1.050888684308604], [-1.210666624270285, 1.1402632642392723, -0.19506960275945007], [0.0307790937421078, -1.5560654384008572, 0.6178018578954751], [-0.662871203184709, 1.1402632642392723, -1.0316819243503268], [0.5785745148276837, -1.5560654384008572, -0.21881046369540158], [-0.7286095026793453, 0.645946238583741, 1.3622950437703323], [-0.32523933709311637, -0.2301440644221562, 1.6264129918427295], [0.9573314465357177, 0.645946238583741, -1.2125329253878778], [1.3607016121219466, -0.2301440644221562, -0.9484149773154806], [-0.7329567518749942, 1.354718182322609, 0.6568707507430379], [0.32308005167742637, -0.9389160081610243, 1.3483405158354533], [0.30901205776517493, 1.354718182322609, -0.9344604493806018], [1.3650488613175955, -0.9389160081610243, -0.24299068428818626], [-0.336620583244891, 1.6254449745585284, -0.22041178379259257], [0.9687126926874923, -1.2096428003969435, 0.6342918502474442], [-1.4850387512679277, -0.9906633299119916, 0.5922929336654642], [-0.05089171998432884, -0.9906633299119916, -1.597986559666409], [-1.8318638997313361, 0.35750102140807305, -0.23244895745743688], [-0.9455122895333135, 0.35750102140807305, -1.586116129198433], [-0.3843374111662901, -1.8238747214487456, -0.2516557174157139], [-1.874070279152174, -0.6412256095550173, -0.26008477011600517], [-0.9877186689541513, -0.6412256095550173, -1.6137519418570012], [-1.3211643601361125, -1.4744370010917713, -0.26742109960630656], [-0.7733689390505365, -1.4744370010917713, -1.1040334211971832], [-1.6679895085995209, -0.12627264977170682, -1.0921629907292074]];

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
    