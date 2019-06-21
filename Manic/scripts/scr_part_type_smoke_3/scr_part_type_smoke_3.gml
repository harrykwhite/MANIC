global.pt_smoke_3 = part_type_create();
var pt = global.pt_smoke_3;

part_type_sprite(pt, spr_ef_smoke_0, false, false, false);
part_type_alpha3(pt, 1, 0.8, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_orientation(pt, 0, 360, 0, 0, 0);
part_type_speed(pt, 0.2, 0.3, -0.005, 0);
part_type_life(pt, 30, 50);
part_type_size(pt, 0.6, 0.7, -0.05, 0);