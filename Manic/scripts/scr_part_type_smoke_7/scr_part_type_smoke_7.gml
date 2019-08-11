global.pt_smoke_7 = part_type_create();
var pt = global.pt_smoke_7;

part_type_colour1(pt, c_black);
part_type_shape(pt, pt_shape_cloud);
part_type_alpha3(pt, 0.5, 0.25, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_speed(pt, 2, 3, -0.15, 0);
part_type_life(pt, 70, 110);
part_type_size(pt, 1.75, 1.75, -0.015, 0);