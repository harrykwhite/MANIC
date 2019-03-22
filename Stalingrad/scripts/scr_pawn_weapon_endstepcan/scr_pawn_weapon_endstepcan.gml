if (instance_exists(owner)){
	if (!global.game_pause) || ((global.cutscene_current == -1) || (owner.cutscene_prop)){
		return true;
	}
}

return false;