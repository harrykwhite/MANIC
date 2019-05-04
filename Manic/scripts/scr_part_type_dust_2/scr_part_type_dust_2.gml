global.pt_dust_2 = part_type_create();
var pt = global.pt_dust_2;

part_type_alpha3(pt, 0.3, 0.8, 0.1);
part_type_colour1(pt, c_white);
part_type_direction(pt, 0, 360, 0, 5);
part_type_speed(pt, 0.25, 0.5, 0, 0.1);
part_type_shape(pt, pt_shape_square);
part_type_life(pt, 60 * 3, 60 * 6);
part_type_scale(pt, 0.02, 0.02);