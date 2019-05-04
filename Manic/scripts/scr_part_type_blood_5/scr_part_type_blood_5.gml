global.pt_blood_5 = part_type_create();
var pt = global.pt_blood_5;

part_type_alpha1(pt, 1);
part_type_orientation(pt, 0, 360, 0.1, 0, 0);
part_type_speed(pt, 1, 2.5, -0.2, 0);
part_type_sprite(pt, spr_ef_blood_2, false, false, true);
part_type_life(pt, 60 * 25, 60 * 40);
part_type_size(pt, 1, 1, 0, 0);