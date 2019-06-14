index = 58;
destroy_on_activate = true;
special = "requirebosskill";

if (!global.game_is_playthrough) || (!scr_player_has_companion(obj_companion_0)){
	instance_destroy();
}