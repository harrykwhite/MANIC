var player = obj_player;
if (instance_exists(player)){
	if (point_distance(x + (sprite_width / 2), y + (sprite_height / 2), player.x, player.y) < 40){
		interact = true;
	}else{
		interact = false;
	}
}else{
	interact = false;
}

if (interact) && (active){
	sprite_index = spr_terminal_0_interact;
	scr_ui_control_indicate("Interact [E]");
	
	if (keyboard_check_pressed(ord("E"))){
		active = false;
		
		switch(special){
			case "unlock_prison_door":
				global.cutscene_current = 40;
				obj_controller_gameplay.cutscene_look_x = 965;
				obj_controller_gameplay.cutscene_look_y = 770;
				obj_controller_gameplay.cutscene_look_time = 60;
				obj_controller_gameplay.cutscene_look_boss = -1;
				obj_controller_gameplay.cutscene_look_object = noone;
				obj_controller_gameplay.cutscene_look_prop = false;
				break;
		}
	}
}else{
	if (active){
		sprite_index = spr_terminal_0;
	}else{
		sprite_index = spr_terminal_0_off;
		
		if (special == "unlock_prison_door"){
			var inst = inst_37AAB649;
			
			if (instance_exists(inst)){
				if (!inst.open){
					inst.open = true;
					scr_effect_screenshake(1);
					scr_sound_play(snd_object_prisondoor_open_0, false, 0.9, 1.1);
				}
			}
		}
	}
}