global.pt_powerhit_0 = part_type_create();
var pt = global.pt_powerhit_0;

part_type_shape(pt, pt_shape_square);
part_type_color2(pt, c_white, c_ltgray);
part_type_alpha3(pt, 0.55, 0.4, 0);
part_type_speed(pt, 3, 4, -0.1, 0);
part_type_orientation(pt, 0, 360, 2, 1, false);
part_type_life(pt, 50, 60);
part_type_size(pt, 0.031, 0.036, -0.00025, 0.001);