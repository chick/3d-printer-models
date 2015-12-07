use <ring.scad>

thickness = 2;
depth = 2;

intersection() {
    rotate([0,0,0]) {
        // back
        cube([depth, thickness,10]);
        
        // bottom leg
        translate([3,0,8]) {
            rotate([0, 135, 0]) {
                cube([depth, thickness, 8]);
            }
         }
         // top arm
         translate([0,0,5]) {
            rotate([0, 45, 0]) {
                cube([depth, thickness, 9]);
            }
         }
    }


    translate([3,3,5]) {
        cube(6);
    }
}