/// @param spd
/// @param dir
var spd = argument0;
var dir = argument1;

if (instance_exists(obj_player)){
    obj_player.knockback = true;
    obj_player.knockback_speed = spd;
    obj_player.knockback_direction = dir - 180;
}
