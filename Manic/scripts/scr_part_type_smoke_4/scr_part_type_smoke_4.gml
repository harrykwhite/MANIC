global.pt_smoke_4 = part_type_create();
var pt = global.pt_smoke_4;

part_type_colour1(pt, make_colour_rgb(20, 20, 20));
part_type_shape(pt, pt_shape_cloud);
part_type_alpha3(pt, 0.8, 0.6, 0);
part_type_orientation(pt, 0, 360, 0, 0, false);
part_type_speed(pt, 2.25, 3.5, -0.075, 0);
part_type_life(pt, 24, 30);
part_type_size(pt, 0.3, 0.4, -0.005, 0.001);