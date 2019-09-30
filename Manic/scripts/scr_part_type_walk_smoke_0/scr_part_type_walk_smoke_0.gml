global.pt_walk_smoke_0 = part_type_create();
var pt = global.pt_walk_smoke_0;

part_type_colour1(pt, make_colour_rgb(234, 234, 234));
part_type_shape(pt, pt_shape_cloud);
part_type_alpha2(pt, 0.8, 0);
part_type_orientation(pt, 0, 360, 0, 0, false);
part_type_speed(pt, 0.25, 0.5, -0.01, 0);
part_type_life(pt, 28, 34);
part_type_size(pt, 0.1, 0.2, -0.005, 0.001);