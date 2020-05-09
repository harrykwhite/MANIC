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
	    var touched = false;
		
		if (place_meeting(x + lengthdir_x((spd / 5) * i, dir), y + lengthdir_y((spd / 5) * i, dir), obj_p_solid)){
	        dir -= 180;
			touched = true;
	    }
		
		if (touched){
	        spd *= 0.85;
			bounce_time = 2;
			break;
		}
	}
}else{
    bounce_time--;
}

// Explode
if (explode){
	scr_explode_effects(60, damage, damage_enemy, damage_player, damage_companion);
	instance_destroy();
}