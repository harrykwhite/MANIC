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
object.light[| eLight.Range] = floor(190 * lightbrightness) + (40 * (flashtime * 0.15) * (global.game_option[| Options.Flashing] / 100));
object.light[| eLight.LutIntensity] = 1.65;
object.light[| eLight.Flags] |= eLightFlags.Dirty;

if (scr_player_has_upgrade(PlayerUpgrade.HeadLight)){
	object.light[| eLight.Range] += 40;
}

with(obj_player){
	if (surrounding_light < surrounding_light_to){
		surrounding_light += 0.002;
	}else if (surrounding_light > surrounding_light_to){
		surrounding_light -= 0.002;
	}
	
	object.light[| eLight.Range] = max(object.light[| eLight.Range] * surrounding_light, 1);
	object.light[| eLight.LutIntensity] = clamp(object.light[| eLight.LutIntensity] * surrounding_light, 0.6, 2);
}