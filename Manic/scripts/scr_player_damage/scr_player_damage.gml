///@param damage
///@param  knockback_speed
///@param  knockback_direction
///@param  invincibility_time
var dmg = round(argument0);
var kbs = argument1 * 1.5;
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
		var d = instance_create(x, y - 4, obj_player_death);
		d.spd = max(kbs * 1.25, 1.35) + random_range(-0.5, 0.5);
		d.dir = kbd;
		d.move = true;
		d.image_xscale = image_xscale;
		d.image_yscale = image_yscale;
	}else{
		global.player_health_current = 1;
	}
}

if (scr_player_has_upgrade(PlayerUpgrade.ExplosiveVest)){
	if (chance(50)){
		scr_explode_effects(75, 4, true, false, false);
	}
}