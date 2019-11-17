if (global.cutscene_current != -1) || (global.game_pause){
	return;
}

with(owner){
	if (cutscene_prop){
		return;
	}

	poison = true;
}