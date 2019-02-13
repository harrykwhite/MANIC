global.pt_dust_3 = part_type_create();
var pt = global.pt_dust_3;

part_type_alpha3(pt, 0, 0.8, 0.1);
part_type_colour1(pt, c_black);
part_type_direction(pt, 150, 210, 0, 8);
part_type_speed(pt, 0.6, 1.7, 0, 0.1);
part_type_shape(pt, pt_shape_square);
part_type_life(pt, 60 * 5, 60 * 10);
part_type_scale(pt, 0.02, 0.02);