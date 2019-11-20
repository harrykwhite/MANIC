if (global.game_pause){
	return;
}

scr_object_table_place(29, 1.215);

// Motion
if (spd > 0.01){
	if (!place_meeting(x + lengthdir_x(spd + 1, dir), y + lengthdir_y(spd + 1, dir), obj_p_solid)){
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}else{
		spd = 0;
	}
	
	spd *= 0.9;
}else{
	spd = 0;
}

// Pickup
if (instance_exists(obj_player)){
    if (distance_to_object(obj_player) < pickup_range){
        pickup = true;
		
		if (global.cutscene_current == -1){
			scr_ui_control_indicate(index == Collectables.DeerMeat ? "Deer Meat" : "Artifact");
		}
    }else{
        pickup = false;
    }
    
    if (pickup) || (pickup_do){
        if (scr_input_is_pressed(InputBinding.Interact) && global.cutscene_current == -1) || (pickup_do){
			instance_destroy();
			
			scr_sound_play(snd_weapon_pickup_collectable, false, 0.8, 1.2);
			scr_player_stamina_drain(6);
			scr_effect_screenshake(1);
			
			if (index != Collectables.DeerMeat) && (listnum != -1){
				global.level_collectable_current[global.level_current] ++;
			
				global.level_collectable_found[# 0, listnum] = true;
			}
			
			if (index == Collectables.Note){
				obj_controller_ui.pausedialogue = true;
				obj_controller_ui.pausedialogue_type = 0;
				obj_controller_ui.pausedialogue_type_text = note_text;
				obj_controller_ui.pausedialogue_option_max = 0;
				obj_controller_ui.pausedialogue_option_selected = 0;
				obj_controller_ui.pausedialogue_option_exittext = "Resume";
				scr_toggle_pause(true);
			}
			
			if (global.game_objective_current == Objectives.CollectAllArtifacts) || (global.game_objective_current == Objectives.CollectAllChestplatePieces) || (index == Collectables.DeerMeat) || (global.game_objective_current == Objectives.CollectAllLeggingsPieces){
				scr_objective_update_counter();
			}
			
			pickup_do = false;
		}
    }
}