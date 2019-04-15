if (global.game_is_playthrough){
	if (!has_saved){
		scr_save_game();
		has_saved = true;
	}
}