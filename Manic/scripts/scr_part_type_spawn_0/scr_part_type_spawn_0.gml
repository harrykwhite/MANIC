global.pt_spawn_0 = part_type_create();
var pt = global.pt_spawn_0;

part_type_colour2(pt, c_black, c_dkgray);
part_type_shape(pt, pt_shape_cloud);
part_type_alpha3(pt, 0.6, 0.4, 0);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_speed(pt, 1, 1.2, -0.005, 0);
part_type_life(pt, 80, 110);
part_type_size(pt, 0.5, 0.6, -0.025, 0);