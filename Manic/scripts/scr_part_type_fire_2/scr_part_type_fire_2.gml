global.pt_fire_2 = part_type_create();
var pt = global.pt_fire_2;

part_type_sprite(pt, spr_ef_fire_0, false, false, true);
part_type_alpha3(pt, 0.8, 0.6, 0);
part_type_speed(pt, 0.8, 1.3, -0.025, 0);
part_type_life(pt, 10, 15);
part_type_direction(pt, 0, 360, 0, 0);
part_type_size(pt, 1.05, 1.55, -0.02, 0);
part_type_orientation(pt, 0, 360, 1, 0, false);
part_type_gravity(pt, 0.06, 90);