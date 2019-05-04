///@param index
var index = argument0;

global.game_score_bonus += global.bonus_points[index];

scr_points_display(string(string_upper(global.bonus_name[index])) + " +" + string(global.bonus_points[index]));