if (room == rm_level_6_00){
	with(obj_controller_levelsix){
		trainboss_trainhead = noone;
		trainboss_leader = noone;
		trainboss_time = 0;
		trainboss_timemax = 60 * 75;
		trainboss_spawned = false;
	}
}

instance_destroy();