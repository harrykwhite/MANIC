global.pt_poison_2 = part_type_create();
var pt = global.pt_poison_2;

part_type_sprite(pt, spr_ef_poison_0, false, false, true);
part_type_alpha3(pt, 0.7, 0.5, 0);
part_type_speed(pt, 0.6, 0.85, -0.01, 0);
part_type_life(pt, 20, 25);
part_type_direction(pt, 0, 360, 0, 0);
part_type_size(pt, 1.1, 1.7, -0.0325, 0);
part_type_orientation(pt, 0, 360, 1, 0, false);
part_type_gravity(pt, 0.01, 90);