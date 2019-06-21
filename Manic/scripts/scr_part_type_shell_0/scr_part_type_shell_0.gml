/// @description scr_part_type_shell_0();
/// @function scr_part_type_shell_0
global.pt_shell_0 = part_type_create();
var pt = global.pt_shell_0;

part_type_direction(pt, 0, 360, 0, 0);
part_type_orientation(pt, 0, 360, 0, 0, false);
part_type_speed(pt, 4, 5, -0.24, 0);
part_type_life(pt, 60 * 15, 60 * 20);
part_type_sprite(pt, spr_ef_shell_0, false, false, true);