global.pt_smoke_6 = part_type_create();
var pt = global.pt_smoke_6;

part_type_colour1(pt, c_black);
part_type_shape(pt, pt_shape_smoke);
part_type_alpha3(pt, 1, 0.8, 0);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_speed(pt, 1.1, 1.3, -0.005, 0);
part_type_life(pt, 90, 130);
part_type_size(pt, 0.1, 0.2, -0.005, 0);
part_type_gravity(pt, 0.05, 90);