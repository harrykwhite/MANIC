// Draw Line
if (!global.game_pause) && (global.cutscene_current == -1) && (instance_exists(obj_player)){
	var mdir = point_direction(global.player_position_x, global.player_position_y, scr_input_get_mouse_x(), scr_input_get_mouse_y());
	var xx = x + lengthdir_x(17, mdir) + lengthdir_x(1, up(mdir));
	var yy = y + lengthdir_y(17, mdir) + lengthdir_y(1, up(mdir));
	
	if (!collision_line(x, y, xx, yy, obj_p_solid, false, true)){
		draw_set_colour(c_maroon);
		draw_set_alpha(clamp(line_alpha, 0, 1) * 0.6 * image_alpha);
		draw_line_break(xx, yy, mdir, obj_p_solid, 1, false, 0);
	}
	
	draw_set_alpha(1);
}

draw_self();
scr_draw_attributes_ranged_weapon();