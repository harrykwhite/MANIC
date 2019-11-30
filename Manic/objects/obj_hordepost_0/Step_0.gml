if (global.game_pause){
	return;
}

var player = obj_player;

if (!completed){
	if (instance_exists(player)) && (!global.game_combat_in_hordechallenge) && (global.boss_current == -1){
		if (point_distance(x, y, player.x, player.y) < 35){
			interact = true;
		}else{
			interact = false;
		}
	}else{
		interact = false;
	}
	
	if (completed_check > 0){
		completed_check --;
	}else if (global.cutscene_current == -1){
		var didchange = false;
		
		switch(global.level_current){
			case Level.TrainStation:
				index = 1;
		
				if (global.game_hordechallenge1_completed) || (scr_player_has_upgrade(PlayerUpgrade.Goggles)){
					completed = true;
					didchange = true;
				}
				break;
	
			case Level.DesolateVillage:
				index = 2;
		
				if (global.game_hordechallenge2_completed) || (scr_player_has_upgrade(PlayerUpgrade.IronGlove)){
					completed = true;
					didchange = true;
				}
				break;
	
			default:
				index = 0;
		
				if (global.game_hordechallenge0_completed) || (scr_player_has_upgrade(PlayerUpgrade.ShoulderBand)){
					completed = true;
					didchange = true;
				}
				break;
		}
		
		if (didchange){
			repeat(9){
		        part_particles_create(global.ps_front, x + random_range(-10, 10), y + 3 + random_range(-17, 17), global.pt_smoke_2, 1);
		    }
		}
		
		completed_check = 10;
	}

	if (interact){
		sprite_index = spr_hordepost_0_interact;
		scr_ui_control_indicate("Interact");
	
		if (interact_break <= 0){
			if (scr_input_is_pressed(InputBinding.Interact) && global.player_stamina_active){
				var srate = scr_horde_get_spawnrate(scr_level_get_index(room));
				scr_player_stamina_drain(4);
				
				interact_break = 15;
				obj_controller_ui.pausedialogue = true;
				obj_controller_ui.pausedialogue_type = 1;
				obj_controller_ui.pausedialogue_type_text = "Start the horde challenge?\n\nSpawn rates will be increased by " + string(srate * 100) + "% for 30 seconds.\nAn upgrade is waiting for those who survive.";
				obj_controller_ui.pausedialogue_option_exittext = "Resume";
				obj_controller_ui.pausedialogue_type_option[0] = "Start the challenge";
				obj_controller_ui.pausedialogue_type_option_scale[0] = 1;
				obj_controller_ui.pausedialogue_type_option_special[0] = 0;
				obj_controller_ui.pausedialogue_option_max = 1;
				
				scr_toggle_pause(true);
			}
		}else{
			if (!obj_controller_ui.pausedialogue){
				interact_break --;
			}
		}
	}else{
		sprite_index = spr_hordepost_0;
	}
}else{
	sprite_index = spr_hordepost_0_destroyed;
}