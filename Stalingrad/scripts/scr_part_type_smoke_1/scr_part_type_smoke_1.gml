/// @description scr_part_type_smoke_1();
/// @function scr_part_type_smoke_1
global.pt_smoke_1 = part_type_create();
var pt = global.pt_smoke_1;

part_type_alpha3(pt, 0.75, 0.4, 0.1);
part_type_direction(pt, 0, 360, 0, 0);
part_type_sprite(pt, spr_ef_smoke_0, false, false, true);
part_type_speed(pt, 0.3, 0.4, -0.02, 0);
part_type_life(pt, 20, 30);
part_type_size(pt, 1, 1.75, -0.025, 0);
part_type_orientation(pt, 0, 360, 1, 0, 0);