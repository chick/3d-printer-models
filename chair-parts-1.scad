margin = 0.02;
circle_steps = 100;


module single_ring() {
    //
    // create a ring on the end of a bar, one end of a link
    //
    difference(){
        union() {
            cylinder(r=1, $fn=circle_steps, center=false);
            translate([0,-1,0]) {
                cube([4,2,1], center=false);
            }
        }
        translate([0,0,-1]){
            cylinder(h=3,r=.4, $fn=circle_steps, center=false);
        }
    }
}

//single_ring();
//translate([0, 0, 1]) {
//    rotate([0, 0, 120]) {
//        color("blue") {
//            single_ring();
//        }
//    }
//}

module stopper_block(angle, upper=false) {
    rotate([upper ? 180 : 0, 0, 0]) {
        difference() {
            translate([1, .5, 0]) {
                color("red") cube([3, 1, 1], center=true);
            }
            cylinder(h=3,r=1+2*margin, $fn=circle_steps, center=true);
            rotate([0, 0, angle]) {
                translate([0, 1, margin]) {
                    color("green")
                    cube([2.01, 2, 1.2], center=true);
                }
            }
        }
    }
}

// stopper_block(30);


module link(top_left_angle, bottom_left_angle, top_right_angle, bottom_right_angle) {
    translate([0, 0, 0]) rotate([0, 0, 0]) {
        single_ring();
        translate([0, 0, 1.5]) {
            stopper_block(top_left_angle, upper=true);
        }
//        translate([0, 0, 1.5]) {
//            stopper_block(bottom_left_angle, upper=false);
//        }
    }
 
//    translate([5, 0, 0]) rotate([0, 0, 180]) {
//        single_ring();
//        translate([0, 0, 1.5]) {
//            stopper_block(top_right_angle, upper=true);
//        }
//        translate([0, 0, 1.5]) {
//            stopper_block(bottom_right_angle, upper=false);
//        }
//    }
}

// single_ring();

color("Aqua") {
    link(20, 45, 70, 55);
}


//translate([10,0,0 ]){
//    rotate([180,0,0]) {
//        mirror([0,0,1]) {
//            color("Orchid") {
//                link(44, 20, 0, 0);
//            }
//        }
//    }
//}