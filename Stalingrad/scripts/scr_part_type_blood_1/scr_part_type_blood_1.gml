global.pt_blood_1 = part_type_create();
var pt = global.pt_blood_1;

part_type_sprite(pt, spr_ef_blood_2, false, false, true);
part_type_alpha3(pt, 0.7, 0.6, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_speed(pt, 0.25, 0.75, -0.08, 0);
part_type_life(pt, 60 * 15, 60 * 25);