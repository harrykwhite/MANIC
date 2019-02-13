global.pt_blood_2 = part_type_create();
var pt = global.pt_blood_2;

part_type_alpha3(pt, 0.7, 0.6, 0);
part_type_colour1(pt, make_colour_rgb(103, 42, 45));
part_type_direction(pt, 0, 360, 0, 0);
part_type_gravity(pt, 0.2, 270);
part_type_speed(pt, 0.11, 0.13, -0.01, 0);
part_type_shape(pt, pt_shape_square);
part_type_life(pt, 14, 17);
part_type_scale(pt, 0.015, 0.02);