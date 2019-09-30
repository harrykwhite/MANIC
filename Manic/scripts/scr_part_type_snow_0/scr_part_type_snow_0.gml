global.pt_snow_0 = part_type_create();
var pt = global.pt_snow_0;

part_type_alpha2(pt, 0.8, 0.6);
part_type_shape(pt, pt_shape_snow);
part_type_color1(pt, c_dkgray);
part_type_scale(pt, 0.065, 0.065);
part_type_direction(pt, 305, 325, 0, 5);
part_type_speed(pt, 2, 3, 0.02, 0.5);
part_type_life(pt, 120, 155);