BODY_DEPTH = 3;
SWITCH_DEPTH = 4.25;
PLATE_DEPTH = 1.5;
FRONT_DEPTH = SWITCH_DEPTH + PLATE_DEPTH;
SWITCH_POSITION = [2.5, 5.5, 0];
ENCODER_POSITION = [75, 15.5, 0];
ENCODER_BODY_SIZE = 12;

// Top
rotate([270, 0, 0])
    cube(size = [90, 30, BODY_DEPTH]);
    
// Bottom
rotate([270, 0, 0])
    translate([0, 0, 30 - BODY_DEPTH])
    cube(size = [90, 30, BODY_DEPTH]);
    
// Sides
rotate([0, 90, 0])
    cube(size = [30, 30, BODY_DEPTH]);
    
rotate([0, 90, 0])
    translate([0, 0, 90 - BODY_DEPTH])
    cube(size = [30, 30, BODY_DEPTH]);

// Back
translate([0, 0, -30 - BODY_DEPTH])
    difference() {
        cube(size = [90, 30, FRONT_DEPTH]);
        translate(ENCODER_POSITION)
            cylinder(10, 8, 8);
    }