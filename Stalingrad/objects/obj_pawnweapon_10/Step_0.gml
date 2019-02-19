if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	
	if (started){
		if (audio_is_playing(shoot_onsound)){
			audio_pause_sound(shoot_onsound);
			shoot_onsound_paused = true;
		}
	}
	exit;
}else{
	if (shoot_onsound_paused){
		audio_resume_sound(shoot_onsound);
		shoot_onsound_paused = false;
	}
}

alpha = approach(alpha, alphaTo, 40);
image_alpha = alpha;

// Attacking
if (instance_exists(owner)){
    alphaTo = 1;
    
	if (attack_time > 0){
		attack_time --;
	}
	
    if (attack ) && (attack_time <= 0){
	    var xpos = x + lengthdir_x(24 * owner.scale, dir) + lengthdir_x(2, up(dir));
		var ypos = y + lengthdir_y(24 * owner.scale, dir) + lengthdir_y(2, up(dir));
		var isEnemy = true;
		
		if (!collision_line(x, y, xpos, ypos, obj_p_solid, false, true)){
			part_type_direction(global.pt_flash_0, dir - 15, dir + 15, 0, 0);
			repeat(1) part_particles_create(global.ps_front, xpos + random_range(-3, 3), ypos + random_range(-3, 3), global.pt_flash_0, 1);
	        part_type_direction(global.pt_smoke_5, dir - 15, dir + 15, 0, 0);
			repeat(1) part_particles_create(global.ps_front, xpos + lengthdir_x(8, dir) + random_range(-3, 3), ypos + lengthdir_y(8, dir) + random_range(-3, 3), global.pt_smoke_5, 1);
			
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
				shoot = instance_create(xpos, ypos, obj_proj_5);
			    shoot.dir = dir + random_range(-9, 9);
				shoot.image_angle = shoot.dir;
				shoot.damage = scr_pawn_weapon_damage(1);
				shoot.strength = 1.5;
				shoot.spd = random_range(10, 15);
				shoot.creator = owner;
				shoot.enemy = isEnemy;
			}
		
	        owner.knockback_speed = -1;
	        owner.knockback_direction = dir;
			
			attack_time = 4;
			angle_offset = 1;
			exit;
		}
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