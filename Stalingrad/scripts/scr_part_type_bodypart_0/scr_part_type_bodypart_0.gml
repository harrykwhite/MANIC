global.pt_bodypart_0 = part_type_create();
var pt = global.pt_bodypart_0;

part_type_alpha3(pt, 1, 0.9, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_speed(pt, 1, 2, -0.0625, 0);
part_type_sprite(pt, spr_enemy_0_bodypart_0, false, false, true);
part_type_life(pt, 60 * 15, 60 * 25);