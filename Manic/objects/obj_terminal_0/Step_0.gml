if (global.game_pause){
	return;
}

var player = obj_player;
if (instance_exists(player)){
	if (point_distance(x, y, player.x, player.y) < 30){
		interact = true;
	}else{
		interact = false;
	}
}else{
	interact = false;
}

if (interact) && (active) && (global.cutscene_current == -1){
	sprite_index = spr_terminal_0_interact;
	scr_ui_control_indicate("Interact");
	
	if (scr_input_is_pressed(InputBinding.Interact) && global.player_stamina_active){
		active = false;
		scr_player_stamina_drain(4);
		
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
		
		if (instance_exists(mylight)){
			instance_destroy(mylight);
			mylight = noone;
		}
		
		if (special == "unlock_prison_door"){
			var inst = inst_37AAB649;
			
			if (instance_exists(inst)){
				if (!inst.open){
					inst.open = true;
					scr_effect_screenshake(1);
					
					var snd = scr_sound_play(snd_object_prisondoor_open_0, false, 0.9, 1.1);
					audio_sound_gain(snd, 0.5 * obj_controller_all.real_sound_volume, 0);
				}
			}
		}
	}
}