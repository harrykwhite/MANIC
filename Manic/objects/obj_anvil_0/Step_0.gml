if (global.game_pause){
	return;
}

var player = obj_player;

if (!completed){
	if (instance_exists(player)) && (!global.game_combat_in_hordechallenge) && (global.boss_current == -1){
		if (point_distance(x, y, player.x, player.y) < 26){
			interact = true;
		}else{
			interact = false;
		}
	}else{
		interact = false;
	}

	if (interact){
		sprite_index = spr_anvil_0_interact;
		scr_ui_control_indicate("Interact");
	
		if (interact_break <= 0){
			if (scr_input_is_pressed(InputBinding.Interact) && global.player_stamina_active){
				scr_player_stamina_drain(4);
				
				if (global.game_objective_current == Objectives.LocateTheAnvil){
					scr_objective_update_counter();
				}
				
				global.cutscene_current = 41;
				completed = true;
			}
		}else{
			if (!obj_controller_ui.pausedialogue){
				interact_break --;
			}
		}
	}else{
		sprite_index = spr_anvil_0;
	}
}else{
	interact = false;
	sprite_index = spr_anvil_0;
}