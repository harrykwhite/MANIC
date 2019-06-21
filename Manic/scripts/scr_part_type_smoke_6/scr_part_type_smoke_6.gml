global.pt_smoke_6 = part_type_create();
var pt = global.pt_smoke_6;

part_type_alpha3(pt, 0.4, 0.6, 0);
part_type_colour1(pt, c_black);
part_type_shape(pt, pt_shape_cloud);
part_type_life(pt, 10, 20);
part_type_scale(pt, 0.125, 0.125);