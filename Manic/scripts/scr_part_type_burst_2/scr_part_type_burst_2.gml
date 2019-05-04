global.pt_burst_2 = part_type_create();
var pt = global.pt_burst_2;

part_type_shape(pt, pt_shape_line);
part_type_color1(pt, c_white);
part_type_alpha3(pt, 1, 0.8, 0);
part_type_gravity(pt, 0.01, 270);
part_type_speed(pt, 2, 4, -0.0025, 0);
part_type_life(pt, 12, 26);
part_type_direction(pt, 0, 360, 0, 0);
part_type_orientation(pt, 0, 0, 0, 0, true);
part_type_size(pt, 0.015, 0.025, -0.0001, 0.001);