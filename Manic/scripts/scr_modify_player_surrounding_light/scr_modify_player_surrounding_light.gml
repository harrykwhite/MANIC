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

object.x = xx;
object.y = yy;
object.Light_Range = 190 + (30 * (flashtime * 0.15) * (global.game_option[| Options.Flashing] / 100));
object.Light_Intensity = 1.65;
object.Light_Intensity *= lightbrightness;

if (scr_player_has_upgrade(PlayerUpgrade.HeadLight)){
	object.Light_Range += 40;
}

with(obj_player){
	if (surrounding_light < surrounding_light_to){
		surrounding_light += min(surrounding_light_to - surrounding_light, 0.0025);
	}else if (surrounding_light > surrounding_light_to){
		surrounding_light -= min(surrounding_light - surrounding_light_to, 0.0025);
	}
	
	object.Light_Range *= surrounding_light;
}