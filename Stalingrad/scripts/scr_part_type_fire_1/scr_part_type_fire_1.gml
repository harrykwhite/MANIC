global.pt_fire_1 = part_type_create();
var pt = global.pt_fire_1;

part_type_sprite(pt, spr_ef_fire_0, false, false, true);
part_type_alpha3(pt, 1, 0.8, 0);
part_type_speed(pt, 2.6, 4.2, -0.2, 0);
part_type_life(pt, 25, 35);
part_type_direction(pt, 0, 360, 0, 0);
part_type_orientation(pt, 0, 360, 1, 0, false);
part_type_size(pt, 1., 1.375, -0.02, 0);