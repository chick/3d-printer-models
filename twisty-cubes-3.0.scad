c_size = 0.4;
final_size = 36;

translate([0,0,final_size-2]) rotate([45,-35,0])
for(i = [4:4:final_size]) {
    translate([0, 0, 0]) {
        rotate([(final_size-i), (final_size-i)*4, (final_size-i)*8]) {
            difference() {
                cube(i, center=true);
                cylinder(r=i*c_size, h=i*2, $fn=100, center=true);
                rotate([0,90,0]) {
                    cylinder(r=i*c_size, h=i*1.5, $fn=100, center=true);
                }
                rotate([0,90,90]) {
                    cylinder(r=i*c_size, h=i*1.5, $fn=100, center=true);
                }
            }
        }
    }
}
cylinder(r=final_size/2.0, h=10, $fn=100);