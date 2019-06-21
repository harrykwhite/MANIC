global.pt_fog_1 = part_type_create();
var pt = global.pt_fog_1;

part_type_colour1(pt, c_gray);
part_type_size(pt, 1, 1, 0, 0.02);
part_type_shape(pt, pt_shape_smoke);
part_type_alpha3(pt, 0, 0.4, 0);
part_type_direction(pt, 360, 360, 0, 0);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_speed(pt, 0.3, 0.4, 0.0001, 0.0001);
part_type_life(pt, 70, 90);