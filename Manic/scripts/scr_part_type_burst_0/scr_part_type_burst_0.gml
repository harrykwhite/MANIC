global.pt_burst_0 = part_type_create();
var pt = global.pt_burst_0;

part_type_alpha3(pt, 1, 0.5, 0.1);
part_type_colour1(pt, c_white);
part_type_direction(pt, 0, 360, 0, 0);
part_type_speed(pt, 0.6, 1.2, -0.025, 0);
part_type_shape(pt, pt_shape_square);
part_type_life(pt, 20, 30);
part_type_scale(pt, 0.03, 0.035);
