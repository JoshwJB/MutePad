BODY_DEPTH = 3;
BODY_WIDTH = 90;
BODY_HEIGHT = 30;
BODY_LENGTH = 60;
MICROUSB_WIDTH = 8;
MICROUSB_HEIGHT = 5;
PROMICRO_WIDTH = 18.5;
PROMICRO_LENGTH = 33.5;
PROMICRO_HEIGHT = 2.8;
PROMICRO_SLOT_SIZE = 4;
PROMICRO_SLOT_HEIGHT = 2;
PROMICRO_SLOT_DEPTH = 2.5;
BACK_SLOT_SIZE = 1;
BACK_SLOT_WIDTH = 10;
SCREW_BOTTOM_SIZE = 6.25;
SCREW_TOP_SIZE = 3;
ANGLE = 25;

difference() {
    
union() {
// Top
difference() {
    rotate([270, 0, 0])
        cube(size = [BODY_WIDTH, BODY_LENGTH, BODY_DEPTH]);
    union() {
        rotate([90, 0, 0])
            translate([18, -BODY_LENGTH / 2, -BODY_DEPTH])
            cylinder(10, SCREW_TOP_SIZE, SCREW_TOP_SIZE);
            
        rotate([90, 0, 0])
            translate([BODY_WIDTH - 18, -BODY_LENGTH / 2, -BODY_DEPTH])
            cylinder(10, SCREW_TOP_SIZE, SCREW_TOP_SIZE);
    }
}
    
// Bottom
difference() {
    rotate([270, 0, 0])
        translate([0, 0, BODY_HEIGHT - BODY_DEPTH])
        cube(size = [BODY_WIDTH, BODY_LENGTH, BODY_DEPTH]);
    union() {
        rotate([90, 0, 0])
            translate([18, -BODY_LENGTH / 2, -BODY_HEIGHT])
            cylinder(10, SCREW_BOTTOM_SIZE, SCREW_BOTTOM_SIZE);
            
        rotate([90, 0, 0])
            translate([BODY_WIDTH - 18, -BODY_LENGTH / 2, -BODY_HEIGHT])
            cylinder(10, SCREW_BOTTOM_SIZE, SCREW_BOTTOM_SIZE);
    }
}
    
    // Side catches for Pro Micro PCB
difference() {
    difference() {  
        translate([(BODY_WIDTH - (PROMICRO_WIDTH + PROMICRO_SLOT_SIZE)) / 2, BODY_HEIGHT - (BODY_DEPTH + PROMICRO_HEIGHT + PROMICRO_SLOT_HEIGHT), -BODY_LENGTH])    
            cube(size = [PROMICRO_WIDTH + PROMICRO_SLOT_SIZE, PROMICRO_HEIGHT + PROMICRO_SLOT_HEIGHT, PROMICRO_SLOT_DEPTH]);
        translate([(BODY_WIDTH - PROMICRO_WIDTH) / 2, BODY_HEIGHT - (BODY_DEPTH + PROMICRO_HEIGHT), -BODY_LENGTH])    
            cube(size = [PROMICRO_WIDTH, PROMICRO_HEIGHT, PROMICRO_SLOT_DEPTH]);
    }

    translate([(BODY_WIDTH - (PROMICRO_WIDTH - PROMICRO_SLOT_SIZE)) / 2, BODY_HEIGHT - (BODY_DEPTH + 10), -BODY_LENGTH]) 
                cube(size = [PROMICRO_WIDTH - PROMICRO_SLOT_SIZE, 10, 10]);
}

    // Back catch for Pro Micro PCB
translate([0, 0, 1.25])
difference() {
    translate([(BODY_WIDTH - BACK_SLOT_WIDTH) / 2, BODY_HEIGHT - (PROMICRO_HEIGHT + BODY_DEPTH + PROMICRO_SLOT_HEIGHT), -BODY_LENGTH + (PROMICRO_LENGTH - BACK_SLOT_SIZE)])
        cube(size = [BACK_SLOT_WIDTH, PROMICRO_HEIGHT + PROMICRO_SLOT_HEIGHT, (BACK_SLOT_SIZE + PROMICRO_SLOT_HEIGHT)]);
    translate([(BODY_WIDTH - BACK_SLOT_WIDTH) / 2, BODY_HEIGHT - (PROMICRO_HEIGHT + BODY_DEPTH), -BODY_LENGTH + (PROMICRO_LENGTH - BACK_SLOT_SIZE)])
        cube(size = [BACK_SLOT_WIDTH, PROMICRO_HEIGHT, BACK_SLOT_SIZE]);
}
    // Pro Micro
//translate([(BODY_WIDTH - PROMICRO_WIDTH) / 2, BODY_HEIGHT - (PROMICRO_HEIGHT + BODY_DEPTH), -BODY_LENGTH])
    //cube(size = [PROMICRO_WIDTH, PROMICRO_HEIGHT, PROMICRO_LENGTH]);

    
// Sides
rotate([0, 90, 0])
    cube(size = [BODY_LENGTH, BODY_HEIGHT, BODY_DEPTH]);
    
rotate([0, 90, 0])
    translate([0, 0, BODY_WIDTH - BODY_DEPTH])
    cube(size = [BODY_LENGTH, BODY_HEIGHT, BODY_DEPTH]);

// Back
translate([0, 0, -BODY_LENGTH - BODY_DEPTH])
    difference() {
        cube(size = [BODY_WIDTH, BODY_HEIGHT, BODY_DEPTH]);
        translate([(BODY_WIDTH - MICROUSB_WIDTH) / 2, BODY_HEIGHT - 9.5, 0])
            cube(size = [MICROUSB_WIDTH, MICROUSB_HEIGHT, 10]);
    }
}
// Angling
translate([0, 30, 0])
rotate([90, 0, 0])
rotate([ANGLE, 0, 0])
    cube(size = [BODY_WIDTH, BODY_HEIGHT + 10, 100]);
}
