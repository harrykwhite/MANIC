if (global.game_pause){
	if (!spawn_pause_update){
		audio_pause_all();
		spawn_pause_update = true;
	}
}else{
	if (spawn_pause_update){
		audio_resume_all();
		spawn_pause_update = false;
	}
}