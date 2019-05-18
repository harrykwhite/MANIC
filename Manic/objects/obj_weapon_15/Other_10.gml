// Draw Line
if (!global.game_pause) && (global.cutscene_current == -1) && (instance_exists(obj_player)){
	var mdir = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
	
	draw_set_colour(c_red);
	draw_set_alpha(clamp(line_alpha, 0, 1));
	draw_line_break(x, y, mdir, obj_p_solid, 1, false);
}

draw_self();
scr_draw_attributes_ranged_weapon();