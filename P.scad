w = 3;
d = 3;

use <ring.scad>

difference() {
    union() {
        cube([w, d, 10]);
        translate([2, 2, 11]) {
            ring([0,0,0]);
        }
        translate([3, 3, 7]) {
            rotate([90,0,0]) {
                cylinder(h=3, r=3, $fn=100);
            }
        }
    }
    translate([3, 4, 7]) {
        rotate([90,0,0]) {
            cylinder(h=5, r=1, $fn=100);
        }
    }
}    