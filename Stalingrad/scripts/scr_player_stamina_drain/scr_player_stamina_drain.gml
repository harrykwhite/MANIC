/// @param time
var amount = argument0;

if (global.player_stamina_active == true){
    global.player_staminaCurrent = 0;
	global.player_staminaMax = amount;
    global.player_staminaBreak = amount;
}
