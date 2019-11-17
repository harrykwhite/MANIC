if (global.game_pause){
	image_speed = 0;
	return;
}

sprite_index = spr_conveyerbelt_2;
image_speed = 1;

if (global.cutscene_current == -1) && (!deactivated) && (global.boss_current == -1){
	if (place_meeting(x, y + 15, obj_player)){
		scr_ui_control_indicate("Interact");
		sprite_index = spr_conveyerbelt_2_interact;
		
		if (scr_input_is_pressed(InputBinding.Interact) && global.player_stamina_active){
			scr_player_stamina_drain(4);
			obj_controller_gameplay.cutscene_conveyerbelt_x = x + (sprite_width / 2);
			obj_controller_gameplay.cutscene_conveyerbelt_y = y + 48;
			global.cutscene_current = 7;
			deactivated = true;
			
			switch(index){
				case 0:
					global.game_conveyerbelt_shutdown0 = true;
					break;
				
				case 1:
					global.game_conveyerbelt_shutdown1 = true;
					break;
				
				case 2:
					global.game_conveyerbelt_shutdown2 = true;
					break;
				
				case 3:
					global.game_conveyerbelt_shutdown3 = true;
					break;
			}
		}
	}
}

if (spawn) && (!stop){
	if (time < timemax){
		time ++;
	}else{
		time = 0;
		instance_create(x + 51, y + 7, obj_environment_enemy_mask_0);
	}
}