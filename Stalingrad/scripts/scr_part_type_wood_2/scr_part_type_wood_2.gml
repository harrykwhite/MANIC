/// @description scr_part_type_wood_2();
/// @function scr_part_type_wood_2
global.pt_wood_2 = part_type_create();
var pt = global.pt_wood_2;

part_type_shape(pt, pt_shape_square);
part_type_color1(pt, make_color_hsv(0, 0, 51));
part_type_alpha3(pt, 1, 0.7, 0);
part_type_gravity(pt, 0.035, 270);
part_type_speed(pt, 1.1, 1.5, -0.03, 0);
part_type_life(pt, 40, 50);
part_type_size(pt, 0.03, 0.035, -0.0005, 0.001);