// Draw Line
if (!global.game_pause) && (global.cutscene_current == -1){
	var mdir = point_direction(x, y, mouse_x, mouse_y);
	var xx = x + lengthdir_x(6, mdir) + lengthdir_x(1, up(mdir));
	var yy = y + lengthdir_y(6, mdir) + lengthdir_y(1, up(mdir));

	draw_set_colour(c_red);
	draw_set_alpha(clamp(line_alpha, 0, 1));
	draw_line_break(xx, yy, mdir, obj_p_solid, 1, false);
}