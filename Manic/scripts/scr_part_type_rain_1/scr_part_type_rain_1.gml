global.pt_rain_1 = part_type_create();
var pt = global.pt_rain_1;

part_type_alpha3(pt, 0.7, 1, 0);
part_type_sprite(pt, spr_ef_rain_1, true, false, true);
part_type_life(pt, 17, 17);
