/// @param amount
var amount = argument0;

if (instance_exists(obj_player)){
    global.player_health_current += amount;
	obj_player.health_scale = 1.5;
}
