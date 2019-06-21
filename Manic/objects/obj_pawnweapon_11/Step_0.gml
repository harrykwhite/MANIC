if (global.game_pause){
	image_speed = 0;
	return;
}


// Attacking
if (instance_exists(owner)){
	if (attack_time > 0){
		attack_time --;
		
		if (within(attack_time, 25, 27)){
			if (!audio_is_playing(snd_weapon_reload_0)){
				scr_sound_play_distance_pitch(snd_weapon_reload_0, false, 360, 1.2, 1.4);
			}
		}
		
		attack_ready = false;
		if (attack_time < 27){
			attack_ready = true;
		}
	}
	
    if ((attack) && (attack_time <= 0)) || (shoot_continue_time > 0){
	    var xpos = x + lengthdir_x(15 * owner.scale, dir) + lengthdir_x(3, up(dir));
		var ypos = y + lengthdir_y(15 * owner.scale, dir) + lengthdir_y(3, up(dir));
		var isEnemy = true;
		
		if (shoot_continue_time <= 0){
			shoot_continue_time = 2;
			angle_offset = 20;
			
			scr_sound_play(snd_weapon_shotgun_0, false, 0.8, 1.2);
			scr_effect_screenshake(2);
			owner.light_brightness = 1.25;
			
			part_type_direction(global.pt_smoke_4, dir - 6, dir + 6, 0, 0);
			part_particles_create(global.ps_front, xpos + lengthdir_x(3, dir) + random_range(-3, 3), ypos + lengthdir_y(3, dir) + random_range(-3, 3), global.pt_smoke_4, 2);
			part_type_direction(global.pt_shell_0, (dir - 180) - 15, (dir - 180) + 15, 0, 0);
		    part_particles_create(global.ps_bottom, x + lengthdir_x(3, dir) + random_range(-3, 3), y + 4 + lengthdir_y(3, dir) + random_range(-3, 3), global.pt_shell_0, 4);
			
			if (owner.pawn == PawnType.Companion){
				isEnemy = false;
			}

			repeat(3){
			    var shoot = instance_create(xpos, ypos, obj_proj_0);
				shoot.damage = 1;
				shoot.damage_change = -0.25;
				shoot.strength = 1;
			    shoot.dir = dir + random_range(-8, 8);
				shoot.spd = 18;
				shoot.image_angle = shoot.dir;
				shoot.enemy = isEnemy;
				shoot.creator = owner;
			}
			
	        owner.knockback_speed = -1;
	        owner.knockback_direction = dir;
			attack_time = attack_time_max;
		}
    }
}

if (shoot_continue_time > 0){
	shoot_continue_time --;
}