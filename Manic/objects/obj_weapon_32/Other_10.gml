// Draw Line
if (!global.game_pause) && (global.cutscene_current == -1) && (instance_exists(obj_player)){
	var xx = x + lengthdir_x(25, image_angle) + lengthdir_x(1, up(image_angle));
	var yy = y + lengthdir_y(25, image_angle) + lengthdir_y(1, up(image_angle));
	
	if (!collision_line(obj_player.x, obj_player.y + 4, xx, yy, obj_p_solid, false, true)){
		draw_set_colour(c_maroon);
		draw_set_alpha(clamp(line_alpha, 0, 1) * 0.6 * image_alpha);
		draw_line_break(xx, yy, image_angle, obj_p_solid, 1, false, 0);
	}
}

draw_self();
scr_draw_attributes_ranged_weapon();