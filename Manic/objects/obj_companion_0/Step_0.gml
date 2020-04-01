var ispaused = false;
var stillsprite = spr_companion_0_idle_2;

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
	
	if (room == rm_level_2_00){
		image_xscale = -scale;
		weapon.dir = 180;
	}
	
	if (global.cutscene_current != -1){
		if (instance_exists(obj_player)){
			if (!collision_line(x, y, obj_player.x, obj_player.y, obj_p_solid, false, true)){
				if (obj_player.x > x){
					image_xscale = scale;
					weapon.dir = 360;
				}else{
					image_xscale = -scale;
					weapon.dir = 180;
				}
			}
		}
	}
	
	return;
}else{
	in_cutscene = false;
	
	// Register companion
	if (!registered){
		global.game_companion_farmer_found = true;
		scr_companion_register(object_index);
		registered = true;
	}else{
		global.player_companions[# 1, order] = health_current;
	}
	
	order = scr_companion_get_order();
}

burn = false;
headless = false;
bleed = false;
poison = false;

if (keyboard_check_pressed(vk_left)){
	scr_pawn_damage(2, 1, 0, 10, false);
}

scr_pawn_status_handler();

if ((global.cutscene_current == -1) || (global.cutscene_current == 2) || (global.cutscene_current == 52) || (global.cutscene_current == 58) || (global.cutscene_current == 1) || depart || depart_standaway || bunker_engine_destroy){
	if (cutscene_break_time > 0){
		cutscene_break_time --;
	}
	
	scr_companion_0_behaviour();
}else{
	image_speed = 0.05;
	sprite_index = stillsprite;
	
	cutscene_break_time = 50;
}

if (flash_time > 0){
	flash_time--;
}

scr_pawn_update();
image_yscale = scale;