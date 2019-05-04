global.pt_smoke_7 = part_type_create();
var pt = global.pt_smoke_7;

part_type_shape(pt, pt_shape_cloud);
part_type_color2(pt, c_black, c_dkgray);
part_type_alpha3(pt, 0, 0.8, 0);
part_type_direction(pt, 80, 100, 0, 0);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_speed(pt, 0.35, 0.7, 0, 0);
part_type_life(pt, 100, 150);
part_type_size(pt, 0.4, 0.5, -0.0005, 0);