/// @param spd
/// @param dir
var spd = argument0;
var dir = argument1;

if (instance_exists(global.player)){
    global.player.knockback = true;
    global.player.knockback_speed = spd;
    global.player.knockback_direction = dir - 180;
}
