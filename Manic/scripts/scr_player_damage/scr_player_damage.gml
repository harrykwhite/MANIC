///@param damage
///@param  knockback_speed
///@param  knockback_direction
///@param  invincibility_time
var dmg = argument0;
var kbs = argument1;
var kbd = argument2;
var it = argument3;

global.player_health_current -= dmg;

knockback_speed = kbs * (near_dead ? 3 : 1);
knockback_direction = kbd;
blend = c_red;
i_time = it;
i_blend_time = 5;
health_scale = 1.5;

obj_controller_ui.playerhit_alpha = 0.75;

if (global.player_health_current <= 0){
	if (!near_dead){
		var d = instance_create(x, y - 16, obj_player_death);
		d.spd = min(1.5, (kbs * 2.5));
		d.dir = kbd;
		d.move = true;
	
		if (kbd < 90) || (kbd > 270){
			d.image_xscale = -1;
		}else{
			d.image_xscale = 1;
		}
	}else{
		global.player_health_current = 1;
	}
}