// Draw Line
if (!global.game_pause) && (global.cutscene_current == -1) && (instance_exists(obj_player)){
	draw_set_colour(c_maroon);
	draw_set_alpha(clamp(line_alpha, 0, 1) * 0.6 * image_alpha);
	draw_line_break(x, y, image_angle, obj_p_solid, 1, false, 0);
	
	draw_set_alpha(1);
}

draw_self();
scr_draw_attributes_ranged_weapon();