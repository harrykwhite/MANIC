///@description scr_part_type_toxic_0();
///@function scr_part_type_toxic_0
global.pt_toxic_0 = part_type_create();
var pt = global.pt_toxic_0;

part_type_colour1(pt, c_white);
part_type_shape(pt, pt_shape_cloud);
part_type_alpha3(pt, 0.6, 0.5, 0);
part_type_orientation(pt, 0, 360, 0.2, 0.5, 0);
part_type_life(pt, 1, 1);
part_type_size(pt, 0.9, 0.9, -0.0015, 0);
part_type_speed(pt, 0.5, 1, -0.025, 0);
part_type_direction(pt, 0, 360, 0, 2);