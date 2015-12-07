    difference(){
    translate([5,0,5   ]){
        rotate([90,0,0]){
            rotate_extrude(convexity = 50, $fn = 100)
            translate([4, 0, 0])
            circle(r = 1, $fn = 100);
        
        }   
    }   
    translate([5,-2,3]){
    
        cube(size = [5,5,4], center = false);
    }

    
}
translate([5, 0, 10]) {
   
    rotate([0, 90, 0]) {
        rotate_extrude(convexity = 10, $fn = 100)
        translate([2, 0, 0])
        circle(r = .5, $fn = 100);
    }
}