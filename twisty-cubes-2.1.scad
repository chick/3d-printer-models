edge_size = 2;

for(i = [4:32]) {
    translate([0, 0, 0]) {
      rotate([i, i*3, i*11]) {
        difference() {
          cube(i, center=true);
          cube([i-edge_size, i + edge_size, i - edge_size], center=true);
          cube([i-edge_size, i - edge_size, i + edge_size], center=true);
          cube([i+edge_size, i - edge_size, i - edge_size], center=true);
        }
      }
    }
}