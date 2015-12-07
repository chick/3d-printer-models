
difference() {
    cube(15, center=true);
    cylinder(16, r=5, $fn=32, center=true);
    rotate([0, 45, 45]) {
        cylinder(30, r=1, $fn=12, center=true);
    }
}
