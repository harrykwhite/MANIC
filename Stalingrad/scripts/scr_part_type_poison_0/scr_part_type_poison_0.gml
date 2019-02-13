/// @description scr_part_type_poison_0();
/// @function scr_part_type_poison_0
global.pt_poison_0 = part_type_create();
var pt = global.pt_poison_0;

part_type_sprite(pt, spr_ef_poison_0, false, false, true);
part_type_alpha3(pt, 0.7, 0.5, 0);
part_type_speed(pt, 0.15, 0.4, -0.1, 0);
part_type_life(pt, 30, 40);
part_type_direction(pt, 0, 360, 0, 0);
part_type_size(pt, 1.1, 1.5, -0.0325, 0);
part_type_orientation(pt, 0, 360, 1, 0, false);
part_type_gravity(pt, 0.01, 90);