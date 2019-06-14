index = 58;
destroy_on_activate = true;
special = "requireclear";

if (!scr_player_has_companion(obj_companion_1)){
	instance_destroy();
}