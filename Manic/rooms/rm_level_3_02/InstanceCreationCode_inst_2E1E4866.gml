index = 58;
destroy_on_activate = true;
check_for_companion = 1;

if (!scr_player_has_companion(obj_companion_1)){
	instance_destroy();
}