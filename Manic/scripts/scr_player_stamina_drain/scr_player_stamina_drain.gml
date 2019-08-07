/// @param time
var amount = argument0;

if (global.player_stamina_active){
    global.player_stamina_current = 0;
	global.player_stamina_max = amount;
    global.player_stamina_break = amount;
}

global.player_stamina_active = false;