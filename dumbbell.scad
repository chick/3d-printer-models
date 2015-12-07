rad=5;
w=20;
bar_rad=1;

sphere(r = rad, $fn=100);
translate([0,w,0]) {
    sphere(r = rad, $fn=100);
}
rotate([-90,0,0]) {
    cylinder(h=w, r=bar_rad, $fn=50);
}   