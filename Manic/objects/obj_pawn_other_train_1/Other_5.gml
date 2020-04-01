if (room == rm_level_6_00){
	with(obj_controller_levelsix){
		trainboss_trainhead = noone;
		trainboss_leader = noone;
		trainboss_time = 0;
		trainboss_timemax = 60 * 75;
		trainboss_spawned = false;
	}
}

if (sound_handler){
	if (audio_is_playing(sound_loop_inst)){
		audio_sound_gain(sound_loop_inst, 0, 3000);
	}
	
	sound_end_played = true;
}

instance_destroy();