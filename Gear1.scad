thick = 4;
over = 0.5;
etch = 1;
comb = thick + over;
ax = 3;

module gear(gear_size) {
    difference() {
        cylinder(h=thick, r=gear_size);
        
        for(angle=[0:30:350]) {
            rotate([0,0,angle]) {
                translate([0,16,-over/2]) {
                    cylinder(h=comb, r=5, $fn=1);
                }
            }
        }
     
        translate([0,0,-5]) {
            cylinder(h=thick*3, r=ax, $fn=50);
        }
        translate([0,0,thick-etch]) {
            cylinder(h=thick, r=gear_size/2, $fn=50);
        }
        translate([0,0,-(thick-etch)]) {
           cylinder(h=thick, r=gear_size, $fn=50);
        }
    }
}

gear(16);
translate([30,0,0]) {
    rotate([0,0, 15]) {
        gear(16);
    }
}