$fn=300;
overshoot = 2;

    mount_radius =  3.625;
    mount_depth  = 15;
    slot_width  =  2;
    slot_depth  =  8;
    cross_bar_length = 12; cross_bar_radius = 1; cross_bar_depth = 10.5;
    
    knob_skirt_outer = 64; knob_skirt_inner = 12; skirt_height = 12;
    knob_skirt_outer_depth = 3;
    
    flange_width = 12; flange_length = knob_skirt_outer*2; flange_depth = 32;
    flange_edge_radius = 4;
    
    sleeve_radius = 9;
    sleeve_depth  = mount_depth + 4;

module mount() {
    difference() {
        cylinder(mount_depth+overshoot, r=mount_radius);
        translate([-(mount_radius + overshoot), -slot_width/2, -overshoot]) {
            cube([((mount_radius+overshoot) * 2), slot_width, slot_depth+overshoot]); 
        }
    }
    translate([0, cross_bar_length/2, cross_bar_depth]) 
        rotate([90, 0, 0]) {
            cylinder(cross_bar_length, r=cross_bar_radius);
            translate([-cross_bar_radius, 0, 0]) {
                cube([2*cross_bar_radius, mount_depth + 2 * overshoot - cross_bar_depth, cross_bar_length]);
            }
    }
}

module sleeve() {
    color("red")
    translate([0, 0, -4])
    cylinder(sleeve_depth, r=sleeve_radius);
}

module knob() {
    minkowski() {
        union() {
            cylinder(skirt_height, r = knob_skirt_outer);
            translate([0, 0, skirt_height]) {
                cylinder(skirt_height, r1=knob_skirt_outer, r2=knob_skirt_inner);
            }
        sphere(flange_edge_radius);
        }
    }
    translate([-flange_width/2, -flange_length/2, skirt_height]) {
        hull() {
            minkowski() {
                cube([flange_width, flange_length, flange_depth]);
                sphere(flange_edge_radius);
            }
            translate([flange_width/2, 0, 0]) {
                cylinder(flange_depth+5, r=flange_edge_radius);
            }
        }
        color("red")
        translate([flange_width/2, 0, 0]) {
            translate([0, 0, flange_depth+5]) {
                sphere(flange_edge_radius);
            }
        }
    }
}

difference() {
    sleeve();
    mount();
}
//translate([0, 0, mount_depth]) {
//    knob();
//}