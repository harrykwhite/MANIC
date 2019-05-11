// Draw Line
if (!global.game_pause) && (global.cutscene_current == -1) && (instance_exists(obj_player)){
	var mdir = point_direction(x, y, mouse_x, mouse_y);
	var xx = obj_player.x + lengthdir_x(22, mdir) + lengthdir_x(1, up(mdir));
	var yy = obj_player.y + lengthdir_y(22, mdir) + lengthdir_y(1, up(mdir));
	
	draw_set_colour(c_red);
	draw_set_alpha(clamp(line_alpha, 0, 1) * 0.7);
	draw_line_break(xx, yy, mdir, obj_p_solid, 1, false, -6);
}

draw_self();
scr_draw_attributes_ranged_weapon();