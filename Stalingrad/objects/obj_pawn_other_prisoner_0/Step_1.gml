if (path_can_start){
	if (!path_started){
		path_start(path, 1.1, path_action_stop, true);
		path_started = true;
	}
}