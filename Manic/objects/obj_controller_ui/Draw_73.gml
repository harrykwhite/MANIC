// Player goggle effect
if (instance_exists(obj_player)){
	if (scr_player_has_upgrade(PlayerUpgrade.Goggles)){
		var enemycount = instance_number(obj_p_enemy);
		
		gpu_set_fog(true, c_red, 0, 0);
		
		for(var i = 0; i < enemycount; i ++){
			var inst = instance_find(obj_p_enemy, i);
			var instdist = point_distance(inst.x, inst.y, obj_player.x, obj_player.y);
			var alpha = 0.1;
			
			alpha *= (instdist / 300);
			alpha *= clamp(100 / instdist, 0, 1);
			
			//var xx = (inst.x - camera_get_view_x(view_camera[0])) * gui_scale_x;
			//var yy = (inst.y - camera_get_view_y(view_camera[0])) * gui_scale_y;
			
			with(inst){
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, alpha * image_alpha);
			}
		}
		
		gpu_set_fog(false, c_black, 0, 0);
	}
}