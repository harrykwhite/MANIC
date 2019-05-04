global.pt_snow_0 = part_type_create();
var pt = global.pt_snow_0;

part_type_alpha2(pt, 0.8, 0.7);
part_type_shape(pt, pt_shape_square);
part_type_color1(pt, c_white);
part_type_scale(pt, 0.0375, 0.0375);
part_type_direction(pt, 305, 325, 0, 5);
part_type_speed(pt, 4, 5.5, 0.02, 0.5);
part_type_life(pt, 70, 95);