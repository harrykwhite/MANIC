/// @description scr_part_type_smoke_1();
/// @function scr_part_type_smoke_1
global.pt_smoke_1 = part_type_create();
var pt = global.pt_smoke_1;

part_type_sprite(pt, spr_ef_smoke_0, false, false, true);
part_type_alpha3(pt, 0.75, 0.4, 0.1);
part_type_direction(pt, 0, 360, 0, 0);
part_type_speed(pt, 0.3, 0.4, -0.015, 0);
part_type_life(pt, 25, 40);
part_type_size(pt, 1, 1.1, -0.05, 0);
part_type_orientation(pt, 0, 360, 1, 0, 0);