if (light_brightness < 1){
	light_brightness += 0.025;
}else if (light_brightness > 1){
	light_brightness -= 0.025;
}

if (type == Enemy0_Type.TrainBoss){
	obj_controller_ui.bosshealth_value_current = health_current;
	obj_controller_ui.bosshealth_value_max = health_max + (18 * 6);
}

if (type == Enemy0_Type.Grenadier) || (type == Enemy0_Type.Sniper) || (type == Enemy0_Type.TrainBoss){
	if (!instance_exists(mylight)) || (mylight == noone){
		mylight = instance_create_layer(x, y - 9, "Lights", obj_enemy_0_light);
	}
	
	mylight.x = x;
	mylight.y = y - (9 * scale);
	mylight.Light_Intensity = max((1.45 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.2);
	
	if (type == Enemy0_Type.TrainBoss){
		mylight.y -= scale;
	}
}

var ispaused = false;

if (global.game_pause){
	ispaused = true;
}

if (ispaused){
	if (abs(image_xscale) != scale) || (abs(image_yscale) != scale){
		image_xscale = sign(image_xscale) * scale;
		image_yscale = scale;
	}
	
	image_speed = 0;
	return;
}

livetime ++;

scr_pawn_status_handler();

if (cutscene_prop){
	if (in_cutscene){
		if (burn) || (burn_time > 0){
			scr_draw_burn_die(6, 18, x, y, 5);
			burn = false;
			burn_time = 0;
		}
	}
}

if (global.cutscene_current == -1) || (cutscene_prop){
	if (headless){
		scr_enemy_0_behaviour_headless() 
	}else if (burn){
		scr_enemy_0_behaviour_burn();
	}else{
		if (type == Enemy0_Type.Crazy){
			scr_enemy_0_behaviour_crazy();
		}else if (type == Enemy0_Type.TrainBoss){
			scr_enemy_0_behaviour_sniperboss();
		}else{
			scr_enemy_0_behaviour();
		}
	}
}else{
	image_speed = 0;
	
	// Train Boss Dialogue Cutscene Defaults
	if (type == Enemy0_Type.TrainBoss) && (global.cutscene_current == 58){
		if (weapon != -1){
			if (instance_exists(weapon)) && (instance_exists(obj_player)){
				weapon.dir = point_direction(x, y, obj_player.x, obj_player.y);
				weapon.attack = false;
				
				if (obj_player.x > x){
					image_xscale = scale;
				}else{
					image_xscale = -scale;
				}
			}
		}
	}
}

scr_pawn_update();
image_yscale = scale;