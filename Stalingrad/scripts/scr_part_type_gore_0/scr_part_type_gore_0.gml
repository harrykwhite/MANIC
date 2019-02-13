global.pt_gore_0 = part_type_create();
var pt = global.pt_gore_0;

part_type_alpha3(pt, 1, 0.5, 0.1);
part_type_direction(pt, 0, 360, 0, 0);
part_type_orientation(pt, 0, 360, 0, 3, 0);
part_type_speed(pt, 0.3, 0.9, -0.025, 0);
part_type_sprite(pt, spr_ef_gore_0, false, false, true);
part_type_life(pt, 60 * 15, 60 * 25);