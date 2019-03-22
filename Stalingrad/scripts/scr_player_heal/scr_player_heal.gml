/// @param amount
var amount = argument0;

if (instance_exists(obj_player)){
    global.player_healthCurrent += amount;
	obj_player.health_scale = 1.5;
}
