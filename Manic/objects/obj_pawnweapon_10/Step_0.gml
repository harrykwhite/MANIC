if (global.game_pause){
	image_speed = 0;
	
	if (started){
		if (audio_is_playing(shoot_onsound)){
			audio_pause_sound(shoot_onsound);
			shoot_onsound_paused = true;
		}
	}
	return;
}else{
	if (shoot_onsound_paused){
		audio_resume_sound(shoot_onsound);
		shoot_onsound_paused = false;
	}
}

// Attacking
if (instance_exists(owner)){
	if (attack_time > 0){
		attack_time --;
	}
	
    if (attack) && (attack_time <= 0){
	    var xpos = x + lengthdir_x(24 * owner.scale, dir) + lengthdir_x(2, up(dir));
		var ypos = y + lengthdir_y(24 * owner.scale, dir) + lengthdir_y(2, up(dir));
		var isEnemy = true;
		
		if (collision_line(owner.x, owner.y + 4, xpos, ypos, obj_p_solid, false, true)){
			var dist = collision_distance_object(owner.x, owner.y + 4, xpos, ypos, obj_p_solid, 1);
			xpos -= lengthdir_x(24 * owner.scale, dir) + lengthdir_x(dist, dir);
			ypos -= lengthdir_y(24 * owner.scale, dir) + lengthdir_y(dist, dir);
		}
		
		part_type_direction(global.pt_smoke_4, dir - 6, dir + 6, 0, 0);
		for(var l = 0; l < 20; l += 4){
			part_particles_create(global.ps_front, xpos + lengthdir_x(-10 + l, dir) + random_range(-3, 3), ypos + lengthdir_y(-10 + l, dir) + random_range(-3, 3), global.pt_smoke_4, 1);
		}
		
		part_type_direction(global.pt_shell_0, (dir - 180) - 15, (dir - 180) + 15, 0, 0);
        part_particles_create(global.ps_bottom, x + lengthdir_x(3, dir) + random_range(-3, 3), y + 4 + lengthdir_y(3, dir) + random_range(-3, 3), global.pt_shell_0, 1);
		
		if (owner.pawn == PawnType.Companion){
			isEnemy = false;
		}
		
		if (!started){
			started = true;
			scr_sound_play(snd_weapon_flamethrower_start_0, false, 0.8, 1.2);
		}
		
		if (!audio_is_playing(shoot_onsound)){
			shoot_onsound = scr_sound_play(snd_weapon_flamethrower_active_0, true, 1, 1);
		}

		repeat(choose(2, 4)){
			var shoot = instance_create(xpos, ypos, obj_proj_5);
		    shoot.dir = dir + random_range(-9, 9);
			shoot.image_angle = shoot.dir;
			shoot.damage = scr_pawn_weapon_damage(1);
			shoot.strength = 1.5;
			shoot.spd = random_range(10, 15);
			shoot.enemy = isEnemy;
			shoot.creator = owner;
		}
		
	    owner.knockback_speed = -1;
	    owner.knockback_direction = dir;
		
		attack_time = 4;
		angle_offset = 1;
    }else if (!attack){
		started = false;

		if (audio_is_playing(shoot_onsound)){
			audio_stop_sound(shoot_onsound);
		}
	}
}else{
	started = false;

	if (audio_is_playing(shoot_onsound)){
		audio_stop_sound(shoot_onsound);
	}
}