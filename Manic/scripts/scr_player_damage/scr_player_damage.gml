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

if (scr_player_has_upgrade(PlayerUpgrade.ExplosiveVest)){
	if (chance(50)){
		var explode_damage = 4;
		var explode_scale = 1.15;
		var explode_damage_size = 70;
		
	    repeat(12){
	        part_particles_create(global.ps_front, x + random_range(-explode_damage_size * explode_scale * 0.5, explode_damage_size * explode_scale * 0.5), y + random_range(-explode_damage_size * explode_scale * 0.5, explode_damage_size * explode_scale * 0.5), global.pt_smoke_2, 1);
	    }
		
		repeat(4){
	        part_particles_create(global.ps_front, x + random_range(-explode_damage_size * explode_scale, explode_damage_size * explode_scale), y + random_range(-explode_damage_size * explode_scale, explode_damage_size * explode_scale), global.pt_smoke_2, 1);
	    }
		
		repeat(9){
			part_particles_create(global.ps_bottom, x + random_range(-explode_damage_size * explode_scale * 0.1, explode_damage_size * explode_scale * 0.1), y + random_range(-explode_damage_size * explode_scale * 0.1, explode_damage_size * explode_scale * 0.1), global.pt_ash_0_perm, 1);
		}
		
		part_particles_create(global.ps_front, x, y, global.pt_fire_1, 21);
		
		var fl = instance_create(x, y, obj_block_light);
		fl.mylight[0] = noone; fl.size[0] = 120;
		fl.fadeSpeed = 0.015;
		
	    scr_damage_custom(explode_damage, 1, explode_damage_size * explode_scale, explode_damage_size * explode_scale, 3, true, false, false, true);
	    scr_effect_screenshake(2);
		scr_effect_zoom(-0.025);
		scr_effect_vignette_flash(c_ltgray, 0.2, 0.01);
		scr_sound_play(snd_weapon_explode_0, false, 0.9, 1.1);
	}
}