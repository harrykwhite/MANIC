///scr_player_flashlight_flash(amount);
var amount = argument0;

if (instance_exists(obj_player)){
	obj_player.flashlight_brightness = amount * 1.35;
}