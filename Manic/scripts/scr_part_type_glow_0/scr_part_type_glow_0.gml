global.pt_glow_0 = part_type_create();
var pt = global.pt_glow_0;

part_type_shape(pt, pt_shape_square);
part_type_color2(pt, c_white, c_ltgray);
part_type_alpha3(pt, 0.7, 0.6, 0);
part_type_direction(pt, 90, 90, 0, 0);
part_type_speed(pt, 0.5, 0.7, -0.005, 0);
part_type_life(pt, 80, 120);
part_type_size(pt, 0.031, 0.036, -0.00075, 0.001);