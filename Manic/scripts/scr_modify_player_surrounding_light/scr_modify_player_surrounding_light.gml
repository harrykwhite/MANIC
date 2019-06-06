///@param object
///@param x
///@param y
var object = argument0;
var xx = argument1;
var yy = argument2;

var lightbrightness = 1;
var flashtime = 0;

if (instance_exists(obj_player)){
	lightbrightness = obj_player.light_brightness;
	flashtime = obj_player.flash_time;
}

object.light[| eLight.X] = xx;
object.light[| eLight.Y] = yy;
object.light[| eLight.Range] = 130 * lightbrightness;
object.light[| eLight.LutIntensity] = 1.65 + (clamp(flashtime, 0, 2) / 10);
object.light[| eLight.Flags] |= eLightFlags.Dirty;

if (scr_player_has_upgrade(PlayerUpgrade.HeadLight)){
	object.light[| eLight.Range] *= 1.3;
}