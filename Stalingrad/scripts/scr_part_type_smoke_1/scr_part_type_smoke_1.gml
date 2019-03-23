/// @description scr_part_type_smoke_1();
/// @function scr_part_type_smoke_1
global.pt_smoke_1 = part_type_create();
var pt = global.pt_smoke_1;

part_type_alpha3(pt, 0.75, 0.4, 0.1);
part_type_direction(pt, 0, 360, 0, 0);
part_type_shape(pt, pt_shape_square);
part_type_color2(pt, c_gray, c_ltgray);
part_type_speed(pt, 0.3, 0.4, -0.015, 0);
part_type_life(pt, 25, 35);
part_type_size(pt, 0.025, 0.05, -0.001, 0);
part_type_orientation(pt, 0, 360, 1, 0, 0);