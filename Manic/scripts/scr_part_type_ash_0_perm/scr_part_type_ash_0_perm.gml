global.pt_ash_0_perm = part_type_create();
var pt = global.pt_ash_0_perm;

part_type_sprite(pt, spr_ef_ash_0, false, false, true);
part_type_alpha3(pt, 0.85, 0.75, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_orientation(pt, 0, 360, 0, 0, true);
part_type_speed(pt, 0, 1, -0.025, 0);
part_type_life(pt, 60 * 60 * 60, 60 * 60 * 60);