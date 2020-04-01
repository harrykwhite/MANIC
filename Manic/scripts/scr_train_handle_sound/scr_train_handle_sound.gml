switch(object_index){
	case obj_pawn_other_train_0:
		if (sound_handler) && (spd > 0){
			sound_left = global.player_position_x >= x;
	
			if (!sound_start_played){
				scr_sound_play(sound_left ? snd_object_train_start_left_0 : snd_object_train_start_right_0, false, 1, 1);
				sound_start_played = true;
			}
	
			if (!sound_loop_played){
				sound_loop_type = sound_left ? snd_object_train_loop_left_0 : snd_object_train_loop_right_0;
		
				sound_loop_inst = scr_sound_play(sound_loop_type, true, 1, 1);
				audio_sound_gain(sound_loop_inst, 0, 0);
				audio_sound_gain(sound_loop_inst, 1 * obj_controller_all.real_sound_volume, 3000);
		
				sound_loop_played = true;
			}else{
				if (sound_left && sound_loop_type == snd_object_train_loop_right_0)
				|| (!sound_left && sound_loop_type == snd_object_train_loop_left_0){
					var pos = audio_sound_get_track_position(sound_loop_inst);
					var gain = audio_sound_get_gain(sound_loop_inst);
		
					audio_stop_sound(sound_loop_inst);
			
					sound_loop_type = sound_left ? snd_object_train_loop_left_0 : snd_object_train_loop_right_0;
			
					sound_loop_inst = scr_sound_play(sound_loop_type, true, 1, 1);
					audio_sound_set_track_position(sound_loop_inst, pos);
					audio_sound_gain(sound_loop_inst, gain, 0);
			
					if (!sound_loop_faded){
						audio_sound_gain(sound_loop_inst, 1 * obj_controller_all.real_sound_volume, 3000);
					}else{
						audio_sound_gain(sound_loop_inst, 0, 8000);
					}
				}
			}
		}
		
		break;
	
	case obj_pawn_other_train_1:
		if (sound_handler) && (spd > 0){
			if (!sound_start_played){
				//scr_sound_play(sound_left ? snd_object_train_start_left_0 : snd_object_train_start_right_0, false, 1, 1);
				sound_start_played = true;
			}
	
			if (!sound_loop_played){
				sound_loop_type = snd_object_train_ride;
		
				sound_loop_inst = scr_sound_play(sound_loop_type, true, 1, 1);
				audio_sound_gain(sound_loop_inst, 0, 0);
				audio_sound_gain(sound_loop_inst, 1 * obj_controller_all.real_sound_volume, 3000);
		
				sound_loop_played = true;
			}else{
				if (spd < 2.5){
					if (!sound_loop_faded){
						audio_sound_gain(sound_loop_inst, 0, 8000);
						sound_loop_faded = true;
					}
				}else{
					sound_loop_faded = false;
				}
			}
		}
		
		break;
}