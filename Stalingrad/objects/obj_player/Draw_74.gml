if (!isVisible){
	exit;
}

// Health
var hp = global.player_healthCurrent;
var scale = 0.9;
health_scale = approach(health_scale, 1, 50);

if (global.cutscene_current == -1){
	if (health_alpha < 1){
		health_alpha += 0.02;
	}
}else{
	if (health_alpha > 0){
		health_alpha -= 0.1;
	}
}

if (i_blend_time > 0){
	gpu_set_fog(true, make_colour_rgb(163, 42, 45), 0, 0);
	draw_sprite_ext(spr_ui_hearts_0, clamp(hp, 0, global.player_healthMax), (x - camera_get_view_x(view_camera[0])) * GUI_POS_X, ((y - camera_get_view_y(view_camera[0])) + 35) * GUI_POS_Y, health_scale * obj_controller_camera.camera_zoom * scale, health_scale * obj_controller_camera.camera_zoom * scale, 0, c_white, health_alpha * 0.7 * (i_blend_time / 3));
	gpu_set_fog(false, c_black, 0, 0);
}

draw_sprite_ext(spr_ui_hearts_0, clamp(hp, 0, global.player_healthMax), (x - camera_get_view_x(view_camera[0])) * GUI_POS_X, ((y - camera_get_view_y(view_camera[0])) + 35) * GUI_POS_Y, health_scale * obj_controller_camera.camera_zoom * scale, health_scale * obj_controller_camera.camera_zoom * scale, 0, c_white, health_alpha * 0.7);