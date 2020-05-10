var ispaused = false;
var stillsprite = spr_companion_3_idle_0;

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

if (cutscene_prop){
	image_speed = 0.05;
	sprite_index = stillsprite;
	
	if (room == rm_level_8_01){
		image_xscale = scale;
	}
	
	if (global.cutscene_current != -1){
		if (instance_exists(obj_player)){
			if (!collision_line(x, y, obj_player.x, obj_player.y, obj_p_solid, false, true)){
				if (obj_player.x > x){
					image_xscale = scale;
				}else{
					image_xscale = -scale;
				}
			}
		}
	}
	
	return;
}else{
	in_cutscene = false;
	
	// Register companion
	if (!registered){
		global.game_companion_dog_found = true;
		scr_companion_register(object_index);
		registered = true;
	}else{
		global.player_companions[# 1, order] = health_current;
	}
	
	order = scr_companion_get_order();
}

headless = false;

scr_pawn_status_handler();

if ((global.cutscene_current == -1) || (global.cutscene_current == 2) || (global.cutscene_current == 52) || (global.cutscene_current == 58)){
	if (cutscene_break_time > 0){
		cutscene_break_time --;
	}
	
	scr_companion_3_behaviour();
}else{
	image_speed = 0.05;
	sprite_index = stillsprite;
	
	cutscene_break_time = 50;
}

scr_pawn_update();

if (room == rm_level_10_01){
	if (y <= finalboss_ymin + 2){
		finalboss_ymin_meeting = true;
	}
	
	y = max(y, finalboss_ymin);
}

image_yscale = scale;