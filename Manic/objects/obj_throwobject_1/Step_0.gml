if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	return;
}

scr_motion_control(false);
image_angle += spd * 3;

// Speed
if (spd > 0){
    spd -= 0.275;
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
if (time < timemax){
	time ++;
}else{
	explode_anim = true;
}

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
    var explode_scale = 1.35;
    var explode_damage_size = 45;
	
	repeat(9 * explode_scale){
        part_particles_create(global.ps_front, x + random_range(-explode_damage_size * explode_scale * 0.5, explode_damage_size * explode_scale * 0.5), y + random_range(-explode_damage_size * explode_scale * 0.5, explode_damage_size * explode_scale * 0.5), global.pt_smoke_2, 1);
    }
	
	repeat(2 * explode_scale){
        part_particles_create(global.ps_front, x + random_range(-explode_damage_size * explode_scale, explode_damage_size * explode_scale), y + random_range(-explode_damage_size * explode_scale, explode_damage_size * explode_scale), global.pt_smoke_2, 1);
    }
    
	part_particles_create(global.ps_front, x, y, global.pt_fire_1, 17);
	
	var fl = instance_create(x, y, obj_block_light);
	fl.mylight[0] = noone; fl.size[0] = 100 * explode_scale;
	fl.fadeSpeed = 0.015;
	
    instance_destroy();
    scr_damage_custom(damage, 1, (explode_damage_size * explode_scale), (explode_damage_size * explode_scale), 3, damage_enemy, damage_player, damage_companion, true);
	scr_damage_custom(round(damage / 1.5), 1, (explode_damage_size * explode_scale) + 15, (explode_damage_size * explode_scale) + 15, 3, damage_enemy, damage_player, damage_companion, true);
    scr_effect_screenshake(6);
	scr_effect_freeze(5);
	scr_effect_vignette_flash(c_ltgray, 0.4, 0.01);
	scr_sound_play_distance(snd_weapon_explode_0, false, 400 * explode_scale);
}