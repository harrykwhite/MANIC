// Draw Line
if (!global.game_pause) && (global.cutscene_current == -1){
	var mdir = point_direction(x, y, mouse_x, mouse_y);
	var xx = x + lengthdir_x(22, mdir) + lengthdir_x(2, up(mdir));
	var yy = y + lengthdir_y(22, mdir) + lengthdir_y(2, up(mdir));
	
	draw_set_colour(c_red);
	draw_set_alpha(clamp(line_alpha, 0, 1) * 0.5);
	draw_line_break(xx, yy, mdir, obj_p_solid, 1, false, -6);
}

draw_self();
scr_draw_attributes_ranged_weapon();