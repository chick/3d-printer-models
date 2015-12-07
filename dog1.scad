smooth=200;
body_rad = 5;
muz_rad = 2;
sphere(r=body_rad, $fn=smooth);
translate([body_rad*0.8,0,0]) {
    sphere(r=body_rad, $fn=smooth);
}
translate([body_rad*2,0,body_rad]) {
    sphere(r=body_rad, $fn=smooth);
}
translate([body_rad*3,0,body_rad]) {
    sphere(r=muz_rad, $fn=smooth);
}

module tail() {
    translate([]) {
        rotate([]) {
        }
    }
}

module ear() {
    base = 2;
    height = 3;
    difference() {
        cylinder(r1=base, r2=0.1, h = height);
        translate([0,-3,-0.5]) {
            cube(base*4);
        }
        translate([0,0,-height]) {
            cylinder(r1=base, r2=0.1, h = height*2);
        }
    }
}

translate([body_rad*2.3,-2,body_rad*1.75]) {
    rotate([30, 0, 0]) {
        ear();
    }
}
translate([body_rad*2.3,2,body_rad*1.75]) {
    rotate([-30, 0, 0]) {
        ear();
    }
}

