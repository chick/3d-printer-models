difference() {
    intersection() {
        sphere(16, center=true);
        cube(20, center=true);
    }
    translate([-5,-1,0]) {
        color("red") {
            linear_extrude(height = 12) {
                text(text = "LAIR", font = font, size = 4, center=true);
            }
        }
    }
    translate([6,-1,0]) {
        rotate([0,180,0]) {
            color("green") {
                linear_extrude(height = 12) {
                    text(text = "BEAR", font = font, size = 4, center=true);
                }
            }
        }
    }
}
color("blue") {
    cube(18, center=true);
}