global.pt_toxic_1 = part_type_create();
var pt = global.pt_toxic_1;

part_type_colour1(pt, c_ltgray);
part_type_shape(pt, pt_shape_smoke);
part_type_alpha3(pt, 0.6, 0.4, 0);
part_type_orientation(pt, 0, 360, 0.2, 0.5, 0);
part_type_life(pt, 30, 45);
part_type_size(pt, 0.2, 0.2, -0.0015, 0);
part_type_speed(pt, 0.5, 1, -0.025, 0);
part_type_direction(pt, 0, 360, 0, 2);