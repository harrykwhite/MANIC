global.pt_flash_0 = part_type_create();
var pt = global.pt_flash_0;

part_type_alpha3(pt, 0.85, 0.75, 0);
part_type_speed(pt, 4, 5, -0.1, 0);
part_type_life(pt, 13, 15);
part_type_size(pt, 0.015, 0.02, 0, 0);
part_type_shape(pt, pt_shape_square);
part_type_color1(pt, c_white);