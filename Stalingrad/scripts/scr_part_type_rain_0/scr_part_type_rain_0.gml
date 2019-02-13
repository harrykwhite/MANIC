/// @function scr_part_type_rain_0
global.pt_rain_0 = part_type_create();
var pt = global.pt_rain_0;

part_type_alpha3(pt, 0.6, 0.5, 0.4);
part_type_sprite(pt, spr_ef_rain_0, false, false, true);
part_type_direction(pt, 315, 315, 0, 0);
part_type_speed(pt, 11, 12, 0, 0);
part_type_life(pt, 130, 175);