if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	exit;
}

alpha = approach(alpha, alphaTo, 40);
image_alpha = alpha;

// Attacking
if (instance_exists(owner)){
    alphaTo = 1;
    
	if (attack_time > 0){
		attack_time --;
		
		if (within(attack_time, 25, 27)){
			if (!audio_is_playing(snd_weapon_reload_0)){
				scr_sound_play(snd_weapon_reload_0, false, 0.9, 1.2);
			}
		}
		
		attack_ready = false;
		if (attack_time < 27){
			attack_ready = true;
		}
	}
	
    if ((attack ) && (attack_time <= 0)) || (shoot_continue_time > 0){
	    var xpos = x + lengthdir_x(19 * owner.scale, dir) + lengthdir_x(3, up(dir));
		var ypos = y + lengthdir_y(19 * owner.scale, dir) + lengthdir_y(3, up(dir));
		var isEnemy = true;
		
		if (!collision_line(x, y, xpos, ypos, obj_p_solid, false, true)){
			if (shoot_continue_time <= 0){
				shoot_continue_time = 2;
				angle_offset = 20;
				
				scr_sound_play(snd_weapon_shoot_0, false, 0.8, 1.2);
				scr_effect_screenshake(2);
				
				part_type_direction(global.pt_flash_0, dir - 15, dir + 15, 0, 0);
				repeat(1) part_particles_create(global.ps_front, xpos + random_range(-3, 3), ypos + random_range(-3, 3), global.pt_flash_0, 1);
		        part_type_direction(global.pt_smoke_5, dir - 15, dir + 15, 0, 0);
				repeat(1) part_particles_create(global.ps_front, xpos + lengthdir_x(8, dir) + random_range(-3, 3), ypos + lengthdir_y(8, dir) + random_range(-3, 3), global.pt_smoke_5, 1);
			}
			
			if (owner.pawn == PawnType.Companion){
				isEnemy = false;
			}

			if (!collision_line(x, y, xpos + lengthdir_x(10, dir), ypos + lengthdir_y(10, dir), obj_p_solid, false, true)){
				repeat(2){
			        shoot = instance_create(xpos, ypos, obj_proj_0);
					shoot.damage = 1;
					shoot.damage_change = -0.25;
					shoot.strength = 1;
			        shoot.dir = dir + random_range(-5, 5);
					shoot.spd = 18;
					shoot.image_angle = shoot.dir;
					shoot.creator = owner;
					shoot.enemy = isEnemy;
				}
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