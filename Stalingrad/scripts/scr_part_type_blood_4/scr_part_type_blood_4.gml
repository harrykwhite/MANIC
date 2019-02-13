global.pt_blood_4 = part_type_create();
var pt = global.pt_blood_4;

part_type_colour1(pt, make_colour_rgb(103, 42, 45));
part_type_size(pt, 1, 0.8, 0, 0);
part_type_shape(pt, pt_shape_square);
part_type_alpha3(pt, 0.55, 0.4, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_speed(pt, 0.7, 0.8, -0.01, 0);
part_type_life(pt, 40, 90);
part_type_size(pt, 0.045, 0.045, -0.005, 0);