index = 52;
moveto_dir = 3;
moveto_room = rm_level_5_post_00;
moveto_level = Level.HumanPrison;
moveto_type = 0;
special = "objectivecomplete";

scr_level_create_end_pointer(moveto_dir * 90);

if (scr_player_has_companion(obj_companion_2)){
	instance_destroy();
}