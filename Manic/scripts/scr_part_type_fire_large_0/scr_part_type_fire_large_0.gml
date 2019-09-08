global.pt_fire_large_0 = part_type_create();
var pt = global.pt_fire_large_0;

part_type_sprite(pt, spr_ef_fire_large_0, false, false, true);
part_type_alpha3(pt, 0.8, 0.6, 0);
part_type_speed(pt, 0.6, 0.7, -0.002, 0);
part_type_life(pt, 55, 70);
part_type_direction(pt, 80, 100, 0, 0.2);
part_type_size(pt, 1.05, 1.55, -0.01, 0);
part_type_orientation(pt, 0, 360, 1, 0, false);