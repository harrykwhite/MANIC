// Health
var hp = health_current;
var scale = 0.9;
health_scale = approach(health_scale, 1, 50);

if (hp < health_max){
	if (health_alpha < 1){
		health_alpha += 0.02;
	}
	
	if (instance_exists(global.player)){
		if (distance_to_object(global.player) > 260){
			if (health_alpha > 0.4){
				health_alpha -= 0.1;
			}else if (health_alpha < 0.4){
				health_alpha += 0.1;
			}
		}
	}else{
		if (health_alpha > 0){
			health_alpha -= 0.1;
		}
	}
}else{
	if (health_alpha > 0){
		health_alpha -= 0.1;
	}
}

draw_sprite_ext(spr_ui_hearts_1, clamp(hp, 0, health_max), (x - camera_get_view_x(view_camera[0])) * GUI_POS_X, ((y - camera_get_view_y(view_camera[0])) + (33 * scale)) * GUI_POS_Y, health_scale * obj_controller_camera.camera_zoom * scale, health_scale * obj_controller_camera.camera_zoom * scale, 0, c_white, health_alpha * 0.7);