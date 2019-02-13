global.pt_blood_3_perm = part_type_create();
var pt = global.pt_blood_3_perm;

part_type_sprite(pt, spr_ef_blood_3, false, false, true);
part_type_alpha3(pt, 0.8, 0.75, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_speed(pt, 0.15, 0.4, -0.035, 0);
part_type_life(pt, 60 * 60 * 60, 60 * 60 * 60);