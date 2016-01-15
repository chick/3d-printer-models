# difference() {
    // main body
    cube([4, 6, 1]);

    // left hand side removal
    translate([-1, 1, -1]) {
        cube([2, 4, 3]);
    }
    // right hand side lower removal
    translate([2, 1, -1]) {
        cube([5, 2, 3]);
    }
    
    // remove stuff to right of bot right serif
    translate([3, -1, -1]) {
        cube([5, 2, 3]);
    }
    translate([0, 1, -1]) {
        cylinder(3, r=1, $fn=100);
    }
    translate([0, 5, -1]) {
        cylinder(3, r=1, $fn=100);
    }
    translate([3, 1, -1]) {
        cylinder(3, r=1, $fn=100);
    }
    translate([2.5, 2.5, -0.5]) {
        difference() { 
            cube([4, 4, 2]);
            translate([0, 2,-2]) {
                cylinder(5, r=1.5, $fn=100);
            }
        }
    }
    translate([2, 4.5, -1]) {
        difference() {
            cylinder(3, r=0.75, $fn=100);
            translate([-1.125, -2, -1]) {
                cube([1, 3, 5]);
            }
        }
    }
}
//translate([4, 0, 0]) {
//    text("P", size=6, font="Times New Roman" );
//}

color("red") {
}




