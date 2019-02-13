global.pt_wood_1 = part_type_create();
var pt = global.pt_wood_1;

part_type_shape(pt, pt_shape_square);
part_type_color1(pt, make_color_hsv(0, 0, 47));
part_type_alpha3(pt, 1, 0.9, 0);
part_type_speed(pt, 1.8, 2.2, -0.1375, 0);
part_type_life(pt, 20, 26);
part_type_size(pt, 0.02, 0.03, -0.00025, 0.001);