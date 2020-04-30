if (global.game_pause) || (global.cutscene_current != -1){
	return;
}

var xx = (x - camera_get_view_x(view_camera[0])) * gui_scale_x;
var yy = (y - camera_get_view_y(view_camera[0])) * gui_scale_y;

if (throw_time > 0){
    var spr_index = (throw_time / throw_time_max) * 37;
    var mdir = point_direction(global.player_position_x, global.player_position_y, scr_input_get_mouse_x(), scr_input_get_mouse_y());
    
    draw_sprite_ext(spr_ui_weapon_throw, spr_index, xx + lengthdir_x(12, mdir), yy + lengthdir_y(12, mdir), 1.25, 1.25, mdir, c_white, throw_alpha);
}

draw_set_alpha(1);