/// @param amount
var amount = argument0;

if (instance_exists(global.player)){
    global.player_healthCurrent += amount;
	global.player.health_scale = 1.5;
}
