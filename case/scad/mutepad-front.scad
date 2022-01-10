BODY_DEPTH = 3;
SWITCH_DEPTH = 6.5;
PLATE_DEPTH = 1.3;
FRONT_DEPTH = SWITCH_DEPTH + PLATE_DEPTH;
SWITCH_POSITION = [4.5, 5.25, 0];
ENCODER_POSITION = [76, 15, 0];
ENCODER_BODY_SIZE = 13; // Actual size is 12mm, but it was too tight a fit so added some clearence

// Front
difference() {
    union() {
        difference() {
            union() {
                difference() {
                    cube(size = [90, 30, FRONT_DEPTH]);
                    
                    union() {
                        linear_extrude(height = FRONT_DEPTH)
                            translate(SWITCH_POSITION)
                            import(file = "keyspacing.dxf");
                        translate([4.75, 7, 0])
                            cube(size = [55, 16, FRONT_DEPTH]);
                    }
                }

                linear_extrude(height = PLATE_DEPTH)
                            translate(SWITCH_POSITION)
                            import(file = "keyspacing.dxf");
            }
            translate(ENCODER_POSITION)
                cylinder(10, 5, 5);
        }

        // Encoder holder
        translate([ENCODER_POSITION[0], ENCODER_POSITION[1], -1.5])
            difference() {
                cube(size = [ENCODER_BODY_SIZE + 2, ENCODER_BODY_SIZE + 2, 3], center = true);
                cube(size = [ENCODER_BODY_SIZE, ENCODER_BODY_SIZE, 3], center = true);
            }
            
        // Catch (For glueing in place to body)
        CATCH_OFFSET = BODY_DEPTH + 0.2;      
        translate([CATCH_OFFSET, CATCH_OFFSET, -3])
            difference() {
                cube(size = [90 - (CATCH_OFFSET * 2), 30 - (CATCH_OFFSET * 2), 3]);
                translate([1, 1, 0])
                    cube(size = [88 - (CATCH_OFFSET * 2), 28 - (CATCH_OFFSET * 2), 3]);
            }
    }
    // Mutepad text
    // translate([4.5, 2, FRONT_DEPTH - 3])
        // linear_extrude(20)
        // text("MutePad", size = 2.5, font = "tahoma:style=bold");
    translate([ENCODER_POSITION[0], ENCODER_POSITION[1], 5.5])
        cube(size = [ENCODER_BODY_SIZE + 1, ENCODER_BODY_SIZE + 1, 8], center = true);
}