if (!global.game_objective_complete){
	if (global.objective_counter[global.game_objective_current] < (global.objective_counter_max[global.game_objective_current] - 1)){
		global.objective_counter[global.game_objective_current] ++;
	}else{
		global.game_objective_complete = true;
		global.objective_counter[global.game_objective_current] = 0;
		
		/*var level = scr_level_get_object();
		with(level){
			if (global.level_current != Level.Prologue){
				if (!audio_is_playing(spawn_music_stinger[2])){
					audio_play_sound(spawn_music_stinger[2], 3, false);
				}
			}
		}*/
	}
	
	obj_controller_ui.objective_scale = 1.25;
}

global.objective_counter[global.game_objective_current] = clamp(global.objective_counter[global.game_objective_current], 0, global.objective_counter_max[global.game_objective_current]);