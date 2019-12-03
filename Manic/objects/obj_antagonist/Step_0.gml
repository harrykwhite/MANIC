if (light_brightness < 1){
	light_brightness += 0.005;
}else if (light_brightness > 1){
	light_brightness -= 0.005;
}

if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y, "Lights", obj_antagonist_light);
}

mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y;
mylight.light[| eLight.LutIntensity] = max((1.6 + (clamp(flash_time, 0, 2) / 10)) * light_brightness, 1.3);
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

if (global.cutscene_current == 58){
	in_cutscene = true;
	
	/*if (!walk_off){
		if (distance_to_object(obj_player) > 90){
			var dirto = point_direction(x, y, obj_player.x, obj_player.y);
			obj_player.move_x_to = x + lengthdir_x(30, dirto);
			obj_player.move_y_to = y + lengthdir_y(30, dirto);
			obj_player.move_ext_spd = 1.5;
		}else{
			if (obj_player.x > x){
				obj_player.move_x_to = obj_player.x - 5;
			}else{
				obj_player.move_x_to = obj_player.x + 5;
			}
		
			obj_player.move_y_to = obj_player.y;
			obj_player.move_ext_spd = 0;
		}
	}*/
}else if (global.cutscene_current == -1){
	if (in_cutscene){
		if (instance_exists(obj_player)){
			obj_player.move_x_to = -1;
			obj_player.move_y_to = -1;
			obj_player.move_ext_spd = 0;
		}
		
		in_cutscene = false;
		cutscene_prop = false;
	}
	
	if (!cutscene_prop){
		active = true;
	}
}

obj_controller_ui.bosshealth_value_current = health_current;
obj_controller_ui.bosshealth_value_max = health_max;

var ispaused = false;
if (global.game_pause){
	ispaused = true;
}

if (!active){
	ispaused = true;
	i_blend_time = 0;
	whiteflash_alpha = 0;
	i_time = 0;
	
	sprite_index = spr_antagonist_idle_0;
	image_speed = 0;
	image_index = 0;
	
	if (instance_exists(obj_player)){
		if (weapon != -1){
			if (instance_exists(weapon) && weapon != -1){
				weapon.attack = false;
				weapon.dir = point_direction(x, y, obj_player.x, obj_player.y);
			}
		}
		
		if (obj_player.x > x){
			image_xscale = scale;
		}else{
			image_xscale = -scale;
		}
	}
}

if (ispaused){
	if (abs(image_xscale) != scale) || (abs(image_yscale) != scale){
		image_xscale = sign(image_xscale) * scale;
		image_yscale = scale;
	}
	
	image_speed = 0;
	return;
}

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

headless = false;

scr_pawn_status_handler();

if (global.cutscene_current == -1) || (cutscene_prop){
	if (room == rm_level_6_pre_00){
		var switched_to_greatsword = false;
		
		if (health_current <= 10){
			health_current = 10;
			
			if (!greatsword_attack){
				greatsword_attack = true;
				switched_to_greatsword = true;
			}
		}
		
		scr_antagonist_behaviour_1();
		
		if (switched_to_greatsword){
			global.cutscene_current = 40;
			cutscene_prop = false;
			in_cutscene = false;
			
			with(obj_controller_gameplay){
				cutscene_look_x = other.x;
				cutscene_look_y = other.y;
				cutscene_look_time = 70;
				cutscene_look_boss = false;
				cutscene_look_prop = true;
				cutscene_look_object = other;
			}
		}
	}else{
		scr_antagonist_behaviour_0();
	}
}else{
	image_speed = 0;
}

scr_pawn_update();
image_yscale = scale;