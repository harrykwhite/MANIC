// Activating corpse objects
if (!deactivate_start){
	with(obj_environment_corpse){
		start = true;
	}
	
	with(obj_environment_soldier_head){
		start = true;
	}
	
	with(obj_environment_soldier_limbs){
		start = true;
	}
	
	deactivate_start = true;
}

// Game Pausing
if (global.game_pause != global.game_pause_nextframe){
	global.game_pause = global.game_pause_nextframe;
	part_system_automatic_update(global.ps_bottom, !global.game_pause_nextframe);
	part_system_automatic_update(global.ps_front, !global.game_pause_nextframe);
}

if (global.cutscene_current == -1) && (instance_exists(obj_player)){
    if (scr_input_is_pressed(InputBinding.Pause)) && (!obj_controller_ui.pausedialogue) && (!obj_controller_ui.pause_has_selected) && (!obj_controller_all.warning_prompt){
        scr_toggle_pause(!global.game_pause);
    }
	
	if (global.game_pause){
		if (scr_input_is_down(InputBinding.Pause)){
			if (pause_time < 1){
				pause_time += 0.025;
			}else{
				ds_grid_clear(global.player_companions, -1);
				scr_fade_object_list_reset();
				scr_level_persistent_reset_level(global.level_current);
				scr_global_set();
				audio_stop_all();
				room_goto(rm_title_0);
			}
		}else{
			pause_time = 0;
		}
	}
}