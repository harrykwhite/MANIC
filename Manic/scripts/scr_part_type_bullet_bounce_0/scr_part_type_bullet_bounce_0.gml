global.pt_bullet_bounce_0 = part_type_create();
var pt = global.pt_bullet_bounce_0;

part_type_shape(pt, pt_shape_square);
part_type_color1(pt, c_white);
part_type_alpha3(pt, 0.7, 0.6, 0);
part_type_speed(pt, 2.25, 4.5, -0.145, 0);
part_type_life(pt, 85, 100);
part_type_size(pt, 0.0295, 0.0355, -0.001, 0.001);