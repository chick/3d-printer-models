    $fn=60;
    overshoot = 0.1;

    mount_radius =   3.0;
    mount_depth  =  14.0;
    slot_width   =   1.4;
    slot_depth   =   0.5;
    
    cross_bar_length = 9.8; 
    cross_bar_radius = 1.0; 
    cross_bar_depth =  9.0;
    
    knob_skirt_outer = 20; knob_skirt_inner = 19; skirt_height = 12;
    knob_skirt_outer_depth = 3;
    
    flange_width = 12; flange_length = knob_skirt_outer*2; flange_depth = 32;
    flange_edge_radius = 4;
    
    sleeve_radius = 8;
    sleeve_depth  = mount_depth + 4;
    
    key_size = 6;

module mount() {
    difference() {
        cylinder(mount_depth+overshoot, r=(mount_radius+overshoot));
        rotate([0,0,-45])
        translate([-(mount_radius + overshoot), -slot_width/2, -overshoot]) {
            cube([((mount_radius+overshoot) * 2), slot_width, slot_depth+overshoot]); 
        }
    }

    translate([0, cross_bar_length/2, cross_bar_depth]) 
        rotate([90, 0, 0]) {
            cylinder(cross_bar_length, r=(cross_bar_radius+overshoot));
            translate([-cross_bar_radius, 0, 0]) {
                cube([2*cross_bar_radius, mount_depth + 2 * overshoot - cross_bar_depth, cross_bar_length]);
            }
    }
}

module sleeve() {
    color("red")
    translate([0, 0, -7])
    cylinder(sleeve_depth+3, r=sleeve_radius);
}

module simple_knob() {
    color("blue") {
        cylinder(skirt_height, r1=knob_skirt_inner, r2=knob_skirt_outer, $fn=30);
    }
}


//mount();
//
difference() {
    sleeve();
    mount();
}
difference() {
    translate([0,0,-mount_depth-5]) {
        simple_knob();
    }
    translate([knob_skirt_outer - 9,0,-18]) {
         color("yellow") {
             rotate([0,0,0]) {
                cylinder(6, r=4, $fn=3);
             }
         }
     }
 }
//translate([0, 0, mount_depth]) {
//    knob();
//}
