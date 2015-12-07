margin = 0.02;
circle_steps = 100;
link_height = 10;
half_height = link_height / 2;
link_length = 25;
half_length = link_length / 2;
link_width = 10;
pin_radius = 2;
half_width = link_width / 2;
link_end_radius = half_width * 0.7;

module single_ring(with_pin_hole=true) {
    //
    // create a ring on the end of a bar, one end of a link
    //
    difference(){
        union() {
            cylinder(r=link_end_radius, h=link_height, $fn=circle_steps, center=false);
            translate([0,-half_width,0]) {
                cube([link_length,link_width,link_height], center=false);
            }
            translate([link_length,0,0]) {
                cylinder(r=link_end_radius, h=link_height, $fn=circle_steps, center=false);
            }
        }
        if(with_pin_hole) {
            translate([0,0,-link_height]){
                cylinder(h=3*link_height, r=pin_radius, $fn=circle_steps, center=false);
            }
            translate([link_length,0,-link_height]){
                cylinder(h=3*link_height, r=pin_radius, $fn=circle_steps, center=false);
            }
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

module stopper(angle_1, angle_2, angle_3, angle_4) {
    difference() {
        color("red") single_ring();
        translate([0,0,half_height]) rotate([0, 0, 180-angle_1]) {
            color("green") scale(1+margin) single_ring();
        }
//        translate([0.8*half_length/2, half_width*0.95, 2.8/2*half_height]) rotate([-90,0,0]) {
//            linear_extrude(height=10) {
//                text(text = str(angle_1), font = font, size = link_height/3);
//            }
//        }
        translate([0,0,half_height]) rotate([0, 0, 180+angle_2]) {
            color("blue") single_ring(with_pin_hole=false);
        }
//        translate([half_length/2, half_width*0.95, 1.5/2*half_height]) rotate([90,0,0]) {
//            linear_extrude(height=10) {
//                text(text = str(angle_2), font = font, size = link_height/3);
//            }
//        }
        translate([link_length,0,half_height]) rotate([0, 0, angle_3]) {
            color("yellow") single_ring(with_pin_hole=false);
        }
//        translate([3*half_length/2, half_width*0.95, 1.5/2*half_height]) rotate([90,0,0]) {
//            linear_extrude(height=10) {
//                text(text = str(angle_3), font = font, size = link_height/3);
//            }
//        }
        translate([link_length,0,half_height]) rotate([0, 0, -angle_4]) {
            color("pink") single_ring(with_pin_hole=false);
        }
//        translate([2.7*half_length/2, half_width*0.95, 2.8/2*half_height]) rotate([-90,0,0]) {
//            linear_extrude(height=10) {
//                text(text = str(angle_4), font = font, size = link_height/3);
//            }
//        }
    }
}

//stopper(45, 60, 30, 0);

for( i = [0 : 6]) {
    translate([-link_length + 3, i * 1.1*link_width, 0]) {
        stopper(30, 90, 30, 90);
    }
}
for( i = [0 : 6]) {
    translate([12, i * 1.1*link_width, 0]) {
        stopper(30, 90, 30, 90);
    }
}

for( i = [0 : 3]) {
    translate([47, i * 1.1*link_width, 0]) {
        stopper(5, 90, 5, 90);
    }
}
for( i = [0 : 3]) {
    translate([47, (i+3) * 1.1*link_width, 0]) {
        stopper(90, 5, 90, 5);
    }
}

    

module stopper_block(angle, upper=false) {
    rotate([upper ? 180 : 0, 0, 0]) {
        difference() {
            translate([1, .5, 0]) {
                color("red") cube([0.75*link_length, 1.1*link_width, link_height], center=true);
            }
            cylinder(h=3*link_height,r=pin_radius+2*margin, $fn=circle_steps, center=true);
            rotate([0, 0, angle]) {
                translate([0, 1, margin]) {
                    color("green")
                    cube([1.01*link_length/2, 2, 1.2*link_height], center=true);
                }
            }
        }
    }
}

//stopper_block(30, upper=true);


module link(top_left_angle, bottom_left_angle, top_right_angle, bottom_right_angle) {
    translate([0, 0, 0]) rotate([0, 0, 0]) {
        single_ring();
        translate([0, 0, 1.49*link_height]) {
            stopper_block(top_left_angle, upper=true);
        }
        translate([0, 0, 1.49*link_height]) {
            stopper_block(bottom_left_angle, upper=false);
        }
    }
 
    translate([5, 0, 0]) rotate([0, 0, 180]) {
        single_ring();
        translate([0, 0, 1.49*link_height]) {
            stopper_block(top_right_angle, upper=true);
        }
        translate([0, 0, 1.49*link_height]) {
            stopper_block(bottom_right_angle, upper=false);
        }
    }
}

// single_ring();

//color("Aqua") {
//    link(20, 45, 70, 55);
//}
//
//
//translate([2.5 * link_length,0,0 ]){
//    rotate([180,0,0]) {
//        mirror([0,0,1]) {
//            color("Orchid") {
//                link(44, 20, 0, 0);
//            }
//        }
//    }
//}