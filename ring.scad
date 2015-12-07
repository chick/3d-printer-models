module ring(offset) {
    translate(offset) {
        rotate([0, 90, 0]) {
            rotate_extrude(convexity = 10, $fn = 100)
            translate([2, 0, 0])
            circle(r = .5, $fn = 100);
        }
    }
}

/*
for( x = [0 : 6]) {
    ring([x, 0, 10]);
}
*/