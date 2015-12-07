cube([5,3,10]);
    

translate([0,10,0]) {
    cube([5,3,10]);
    rotate([49.75,0,0]) {
        cube([5,3,12]);
    }
}
// this builds the ring
translate([2.5, 7, 7]) {
   
    rotate([0, 90, 0]) {
        rotate_extrude(convexity = 10, $fn = 100)
        translate([2, 0, 0])
        circle(r = .5, $fn = 100);
    }
}