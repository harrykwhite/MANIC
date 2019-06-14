index = 52;
moveto_dir = 3;
moveto_room = rm_level_6_pre_00;
moveto_level = Level.TrainStation;
moveto_type = 0;
special = "requireclear";

if (scr_player_has_companion(obj_companion_2)){
	instance_destroy();
}