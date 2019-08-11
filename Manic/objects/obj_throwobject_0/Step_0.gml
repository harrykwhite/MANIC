if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	return;
}

image_speed = 1;
scr_motion_control(false);

// Speed
if (spd > 0){
    spd -= 0.3;
}else{
    spd = 0;
}

// Explode
if (explode_anim){
	if (scale < 1.3){
		scale += 0.02;
	}else{
		explode = true;
	}
	
	image_xscale = scale;
	image_yscale = scale;
}

// Time
time ++;

// Bouncing
if (bounce_time <= 0) && (spd > 0){
	for(var i = 0; i < 5; i ++){
	    if (place_meeting(x + lengthdir_x(i, dir), y + lengthdir_y(i, dir), obj_p_solid)){
	        dir = dir - 180;
	        bounce_time = 15;
	        spd *= 0.75;
			break;
	    }
	}
}else{
    bounce_time--;
}

// Explode
if (explode){
	var explode_scale = 1.15;
	var explode_damage_size = 45;
	
    repeat(9){
        part_particles_create(global.ps_front, x + random_range(-explode_damage_size * explode_scale * 0.5, explode_damage_size * explode_scale * 0.5), y + random_range(-explode_damage_size * explode_scale * 0.5, explode_damage_size * explode_scale * 0.5), global.pt_smoke_2, 1);
    }
	
	repeat(2){
        part_particles_create(global.ps_front, x + random_range(-explode_damage_size * explode_scale, explode_damage_size * explode_scale), y + random_range(-explode_damage_size * explode_scale, explode_damage_size * explode_scale), global.pt_smoke_2, 1);
    }
	
	repeat(7){
		part_particles_create(global.ps_bottom, x + random_range(-explode_damage_size * explode_scale * 0.5, explode_damage_size * explode_scale * 0.5), y + random_range(-explode_damage_size * explode_scale * 0.25, explode_damage_size * explode_scale * 0.25), global.pt_ash_0_perm, 1);
	}
    
	part_particles_create(global.ps_front, x, y, global.pt_fire_1, 17);
	
	var fl = instance_create(x, y, obj_block_light);
	fl.mylight[0] = noone; fl.size[0] = 100;
	fl.fadeSpeed = 0.015;
	
    instance_destroy();
    scr_damage_custom(damage, 1, explode_damage_size * explode_scale, explode_damage_size * explode_scale, 3, damage_enemy, damage_player, damage_companion, true);
	scr_damage_custom(round(damage / 2), 1, (explode_damage_size * explode_scale) + 15, (explode_damage_size * explode_scale) + 15, 3, damage_enemy, damage_player, damage_companion, true);
    scr_effect_screenshake(4);
	scr_effect_freeze(13);
	scr_effect_zoom(-0.1);
	scr_effect_vignette_flash(c_ltgray, 0.4, 0.01);
	scr_sound_play_distance(snd_weapon_explode_0, false, 400 * explode_scale);
}