global.pt_smoke_2 = part_type_create();
var pt = global.pt_smoke_2;

part_type_colour1(pt, c_black);
part_type_shape(pt, pt_shape_smoke);
part_type_alpha3(pt, 0.5, 0.25, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_speed(pt, 0.7, 0.8, -0.005, 0);
part_type_life(pt, 40, 90);
part_type_size(pt, 1, 1, -0.02, 0);