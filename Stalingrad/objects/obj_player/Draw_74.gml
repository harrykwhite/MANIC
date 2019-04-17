if (!isVisible){
	return;
}

// Health
var hp = global.player_health_current;
var scale = 0.9;
health_scale = approach(health_scale, 1, 40);

if (global.cutscene_current == -1){
	if (health_alpha < 1){
		health_alpha += 0.02;
	}
}else{
	if (health_alpha > 0){
		health_alpha -= 0.1;
	}
}

if (global.player_health_max == 12){
	draw_sprite_ext(spr_ui_hearts_0, clamp(hp, 0, 6), (x - camera_get_view_x(view_camera[0])) * GUI_SCALE_X, ((y - camera_get_view_y(view_camera[0])) + 35) * GUI_SCALE_Y, health_scale * scale * 0.75, health_scale * scale * 0.75, 0, c_white, health_alpha * 0.7);
	draw_sprite_ext(spr_ui_hearts_0, clamp(hp - 6, 0, 6), (x - camera_get_view_x(view_camera[0])) * GUI_SCALE_X, ((y - camera_get_view_y(view_camera[0])) + 42) * GUI_SCALE_Y, health_scale * scale * 0.75, health_scale * scale * 0.75, 0, c_white, health_alpha * 0.7);

	if (i_blend_time > 0){
		gpu_set_fog(true, make_colour_rgb(163, 42, 45), 0, 0);
		draw_sprite_ext(spr_ui_hearts_0, clamp(hp, 0, 6), (x - camera_get_view_x(view_camera[0])) * GUI_SCALE_X, ((y - camera_get_view_y(view_camera[0])) + 35) * GUI_SCALE_Y, health_scale * scale * 0.75, health_scale * scale * 0.75, 0, c_white, health_alpha * 0.7 * (i_blend_time / 3));
		draw_sprite_ext(spr_ui_hearts_0, clamp(hp - 6, 0, 6), (x - camera_get_view_x(view_camera[0])) * GUI_SCALE_X, ((y - camera_get_view_y(view_camera[0])) + 42) * GUI_SCALE_Y, health_scale * scale * 0.75, health_scale * scale * 0.75, 0, c_white, health_alpha * 0.7 * (i_blend_time / 3));
		gpu_set_fog(false, c_black, 0, 0);
	}
}else{
	draw_sprite_ext(spr_ui_hearts_0, clamp(hp, 0, global.player_health_max), (x - camera_get_view_x(view_camera[0])) * GUI_SCALE_X, ((y - camera_get_view_y(view_camera[0])) + 35) * GUI_SCALE_Y, health_scale * scale, health_scale * scale, 0, c_white, health_alpha * 0.7);

	if (i_blend_time > 0){
		gpu_set_fog(true, make_colour_rgb(163, 42, 45), 0, 0);
		draw_sprite_ext(spr_ui_hearts_0, clamp(hp, 0, global.player_health_max), (x - camera_get_view_x(view_camera[0])) * GUI_SCALE_X, ((y - camera_get_view_y(view_camera[0])) + 35) * GUI_SCALE_Y, health_scale * scale, health_scale * scale, 0, c_white, health_alpha * 0.7 * (i_blend_time / 3));
		gpu_set_fog(false, c_black, 0, 0);
	}
}