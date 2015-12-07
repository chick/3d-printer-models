use <ring.scad>

thickness = 2.5;
rotate([0,0,0]) {
    cube([3, thickness,10]);
    translate([6,0,0]) {
        rotate([0, -45, 0]) {
            cube([3, thickness, 6]);
        }
     }
    translate([1,0,5]) {
        rotate([0, 45, 0]) {
            cube([3, thickness, 6]);
        }
     }
//     translate(10, 0, 10) {
//        rotate([0, 45, 0]) {
//            cube([3, 5, 6]);       
//        }
//    
//        
//    }
}
translate([4.0,thickness/2,8]) {
    rotate([0,0,90]) {
        ring([0,0,0]);
    }
}