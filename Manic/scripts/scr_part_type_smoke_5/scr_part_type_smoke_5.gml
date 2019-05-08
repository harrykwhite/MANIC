global.pt_smoke_5 = part_type_create();
var pt = global.pt_smoke_5;

part_type_colour1(pt, c_black);
part_type_shape(pt, pt_shape_cloud);
part_type_alpha3(pt, 0.25, 0, 0);
part_type_orientation(pt, 0, 360, 0, 0, false);
part_type_speed(pt, 1, 1.3, -0.003, 0);
part_type_life(pt, 35, 50);
part_type_size(pt, 0.4, 0.5, -0.015, 0);