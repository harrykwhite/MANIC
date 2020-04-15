if (!obj_controller_all.show_ui){
	return;
}

// Health
var hp = health_current;
health_scale = approach(health_scale, 1, 40);

scr_pawn_health_alpha();

if (health_flash > 0.01){
	health_flash *= 0.85;
}else{
	health_flash = 0;
}

var width = 30;
var height = 4;
var xx = x;
var yy = y + 6;

var x1 = ((xx - camera_get_view_x(view_camera[0])) * gui_scale_x) - (width / 2);
var y1 = ((yy - camera_get_view_y(view_camera[0])) * gui_scale_y) - (height / 2);
var x2 = ((xx - camera_get_view_x(view_camera[0])) * gui_scale_x) + (width / 2);
var y2 = ((yy - camera_get_view_y(view_camera[0])) * gui_scale_y) + (height / 2);

draw_set_alpha(health_alpha);
draw_healthbar(x1, y1, x2, y2, (hp / health_max) * 100, make_colour_rgb(38, 38, 38), c_ltgray, c_ltgray, 0, true, false);
draw_set_alpha(health_alpha * (health_flash * 0.5));
draw_healthbar(x1, y1, x2, y2, (hp / health_max) * 100, make_colour_rgb(38, 38, 38), c_ltgray, c_ltgray, 0, true, false);
draw_set_alpha(1);