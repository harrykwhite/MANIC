global.pt_blood_0 = part_type_create();
var pt = global.pt_blood_0;

part_type_alpha3(pt, 1, 0.5, 0);
part_type_colour1(pt, make_colour_rgb(103, 42, 45));
part_type_direction(pt, 0, 360, 0, 0);
part_type_gravity(pt, 0.08, 270);
part_type_speed(pt, 0.4, 0.5, 0, 0);
part_type_shape(pt, pt_shape_square);
part_type_life(pt, 30, 40);
part_type_size(pt, 0.02, 0.025, -0.0001, 0);