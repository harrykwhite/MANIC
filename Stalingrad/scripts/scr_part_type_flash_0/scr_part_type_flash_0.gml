global.pt_flash_0 = part_type_create();
var pt = global.pt_flash_0;

part_type_alpha3(pt, 1, 0.9, 0);
part_type_speed(pt, 5, 6, -0.15, 0);
part_type_life(pt, 6, 9);
part_type_size(pt, 0.015, 0.02, 0, 0);
part_type_shape(pt, pt_shape_square);
part_type_color1(pt, c_white);