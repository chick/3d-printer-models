linear_extrude(height = 12.5) {
    text(text = "KALEA", font = font, size = 10);
}
translate([1.1, 0, 0 ]) {
    cube([63, .5, 12.5]);
}
translate([0,-9,0]) {
    linear_extrude(height = 12.5) {
        text(text = "WALTHALL", font = font, size = 10);
    }
}