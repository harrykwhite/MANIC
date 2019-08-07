global.pt_smoke_3 = part_type_create();
var pt = global.pt_smoke_3;

part_type_colour1(pt, c_dkgray);
part_type_shape(pt, pt_shape_cloud);
part_type_alpha3(pt, 0.3, 0.2, 0);
part_type_direction(pt, 80, 100, 0, 0);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_speed(pt, 1, 2, 0, 0);
part_type_life(pt, 60, 90);
part_type_size(pt, 0.5, 0.5, -0.0005, 0.001);