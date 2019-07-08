global.pt_stick_break_flash_0 = part_type_create();
var pt = global.pt_stick_break_flash_0;

part_type_shape(pt, pt_shape_square);
part_type_colour1(pt, c_white);
part_type_alpha1(pt, 1);
part_type_direction(pt, 0, 360, 0, 0);
part_type_speed(pt, 0.2, 0.4, -0.025, 0);
part_type_life(pt, 20, 30);
part_type_size(pt, 0.04, 0.07, -0.01, 0.001);