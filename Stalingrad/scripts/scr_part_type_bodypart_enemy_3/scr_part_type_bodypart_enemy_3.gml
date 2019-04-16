global.pt_bodypart_enemy_3 = part_type_create();
var pt = global.pt_bodypart_enemy_3;

part_type_alpha1(pt, 1);
part_type_direction(pt, 0, 360, 0, 0);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_speed(pt, 2.3, 3, -0.075, 0);
part_type_sprite(pt, spr_enemy_3_bodypart_0, false, false, true);
part_type_life(pt, 60 * 15, 60 * 25);