for(i = [4:20]) {
    translate([0, 0, 0]) {
        rotate([i, i*4, i*8]) {
            difference() {
                cube(i, center=true);
                cube([i-1, i + 1, i - 1], center=true);
                cube([i-1, i - 1, i + 1], center=true);
                cube([i+1, i - 1, i - 1], center=true);
            }
        }
    }
}