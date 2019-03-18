/// @param damage
/// @param  knockback_speed
/// @param  knockback_direction
/// @param  invincibility_time
var dmg = argument0;
var kbs = argument1;
var kbd = argument2;
var it = argument3;

global.player_healthCurrent -= dmg;
knockback_speed = kbs;
knockback_direction = kbd;
blend = make_color_rgb(76, 53, 53);
i_time = it;
i_blendTime = 5;
speed_offset = 1.5;
speed_offset_change = 0.1;
health_scale = 1.5;

if (instance_exists(obj_controller_ui)){
    obj_controller_ui.playerhit_alpha = 0.75;
}

if (global.player_healthCurrent <= 0){
	var d = instance_create(x, y - 16, obj_player_death);
	d.spd = min(1.5, (kbs * 2));
	d.dir = kbd;
	d.move = true;
	
	if (kbd < 90) || (kbd > 270){
		d.image_xscale = -1;
	}else{
		d.image_xscale = 1;
	}
}