index = 58;
destroy_on_activate = true;
special = "objectivecomplete";
check_for_companion = 2;

if (!scr_player_has_companion(obj_companion_2)){
	instance_destroy();
}