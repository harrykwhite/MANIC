///@description scr_part_type_burst_1();
///@function scr_part_type_burst_1
global.pt_burst_1 = part_type_create();
var pt = global.pt_burst_1;

part_type_alpha3(pt, 1, 0.5, 0.1);
part_type_colour1(pt, c_dkgray);
part_type_shape(pt, pt_shape_disk);
part_type_orientation(pt, 0, 360, 10, 1, 0);
part_type_life(pt, 30, 40);
part_type_size(pt, 0.13, 0.13, 0.002, 0.001);
