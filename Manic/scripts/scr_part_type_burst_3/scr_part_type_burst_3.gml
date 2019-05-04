global.pt_burst_3 = part_type_create();
var pt = global.pt_burst_3;

part_type_shape(pt, pt_shape_square);
part_type_color2(pt, c_black, c_dkgray);
part_type_alpha3(pt, 0.7, 0.6, 0);
part_type_gravity(pt, 0.01, 270);
part_type_speed(pt, 1, 2, -0.075, 0);
part_type_life(pt, 120, 180);
part_type_size(pt, 0.031, 0.036, -0.00075, 0.001);