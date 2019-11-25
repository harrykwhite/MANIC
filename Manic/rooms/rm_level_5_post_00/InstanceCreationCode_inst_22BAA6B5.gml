index = 58;
destroy_on_activate = true;
special = "objectivecomplete";

if (!scr_player_has_companion(obj_companion_2)){
	instance_destroy();
}