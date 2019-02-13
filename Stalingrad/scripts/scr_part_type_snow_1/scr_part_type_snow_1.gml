global.pt_snow_1 = part_type_create();
var pt = global.pt_snow_1;

part_type_alpha2(pt, 0.8, 0);
part_type_shape(pt, pt_shape_square);
part_type_color1(pt, c_white);
part_type_scale(pt, 0.04, 0.04);
part_type_life(pt, 30, 45);