if (global.game_pause){
	return;
}

if (!found){
	if (instance_exists(obj_player)){
		if (point_distance(x, y, obj_player.x, obj_player.y) < 35){
			interact = true;
		}else{
			interact = false;
		}
	}else{
		interact = false;
	}
	
	if (index == -1){
		index = global.level_current;
		
		if (global.level_checkpoint_found[index]){
			found = true;
		}
	}
	
	if (interact && global.cutscene_current == -1){
		sprite_index = spr_checkpoint_0_interact;
		scr_ui_control_indicate("Interact");
		
		if (interact_break <= 0){
			if (scr_input_is_pressed(InputBinding.Interact) && global.player_stamina_active){
				scr_sound_play(snd_weapon_pickup_2, false, 0.8, 1.2);
				scr_player_stamina_drain(4);
				obj_controller_gameplay.checkpoint_create = true;
				global.level_checkpoint_found[global.level_current] = true;
				found = true;
				
				sprite_index = spr_checkpoint_0_found;
				image_speed = 1;
			}
		}else{
			interact_break --;
		}
	}else{
		sprite_index = spr_checkpoint_0;
	}
}else{
	sprite_index = spr_checkpoint_0_found;
}