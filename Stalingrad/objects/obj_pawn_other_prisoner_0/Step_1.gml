if (path_can_start){
	if (!path_started){
		path_start(path, spd, path_action_stop, true);
		path_started = true;
	}
}