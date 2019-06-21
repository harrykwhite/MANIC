global.pt_snow_1 = part_type_create();
var pt = global.pt_snow_1;

part_type_alpha2(pt, 0.6, 0);
part_type_shape(pt, pt_shape_snow);
part_type_color1(pt, c_white);
part_type_scale(pt, 0.065, 0.065);
part_type_life(pt, 40, 55);