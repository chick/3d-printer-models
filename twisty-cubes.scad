for(i = [4:20]) {
    translate([i*2, 0, 0]) {
        rotate([i, i*2, i*3]) {
            difference() {
                cube(i, center=true);
                cube([i-1, i + 1, i - 1], center=true);
                cube([i-1, i - 1, i + 1], center=true);
                cube([i+1, i - 1, i - 1], center=true);
            }
        }
    }
}