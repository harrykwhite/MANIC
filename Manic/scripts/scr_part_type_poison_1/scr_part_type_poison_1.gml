global.pt_poison_1 = part_type_create();
var pt = global.pt_poison_1;

part_type_sprite(pt, spr_ef_poison_0, false, false, true);
part_type_alpha3(pt, 0.7, 0.5, 0);
part_type_speed(pt, 0.4, 0.65, -0.025, 0);
part_type_life(pt, 10, 15);
part_type_direction(pt, 0, 360, 0, 0);
part_type_size(pt, 1.1, 1.7, -0.0325, 0);
part_type_orientation(pt, 0, 360, 1, 0, false);
part_type_gravity(pt, 0.05, 90);