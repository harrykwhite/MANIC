if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	return;
}

scr_motion_control(false);
image_angle += spd * 3;

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
	
	instance_destroy();
	scr_damage_custom(damage, 1, explode_damage_size * explode_scale, explode_damage_size * explode_scale, 3, damage_enemy, damage_player, damage_companion, true);
    scr_damage_custom_toxic(explode_damage_size * explode_scale, explode_damage_size * explode_scale, 140, damage_companion);
    scr_effect_screenshake(6);
	scr_effect_freeze(13);
	scr_effect_zoom(-0.1);
	scr_effect_vignette_flash(c_ltgray, 0.35, 0.01);
	scr_sound_play_distance(snd_weapon_explode_0, false, 400 * explode_scale);
}