if (instance_exists(turret)){
	if (shoot){
		if (shoot_break > 0){
			shoot_break --;
		}else{
			var ang = turret.flamethrower_angle + shoot_dir;
			var xpos = x + lengthdir_x(1, ang);
			var ypos = y + lengthdir_y(1, ang);
		
			part_type_direction(global.pt_smoke_4, ang - 6, ang + 6, 0, 0);
			for(var l = 0; l < 20; l += 4){
				part_particles_create(global.ps_front, xpos + lengthdir_x(-10 + l, ang) + random_range(-3, 3), ypos + lengthdir_y(-10 + l, ang) + random_range(-3, 3), global.pt_smoke_4, 1);
			}
		
			repeat(choose(2, 3)){
				var flame = instance_create(xpos, ypos, obj_proj_5);
				flame.dir = ang + random_range(-1, 1);
				flame.image_xscale = 0.9;
				flame.image_yscale = 0.9;
				flame.image_angle = flame.dir;
				flame.damage = 1;
				flame.strength = 1.2;
				flame.spd = random_range(10, 14);
				flame.enemy = true;
			}
		
			if (!shoot_previous){
				scr_sound_play_distance_pitch(snd_weapon_flamethrower_start_1, false, shoot_sound_radius, shoot_sound_pitch, shoot_sound_pitch);
			}
		
			if (!audio_is_playing(shoot_sound) || shoot_sound == noone){
				shoot_sound = scr_sound_play_distance_pitch(snd_weapon_flamethrower_active_1, true, shoot_sound_radius, shoot_sound_pitch, shoot_sound_pitch);
			}
			
			shoot_break = shoot_break_max;
		}
	}
}else{
	shoot = false;
}

if (audio_is_playing(shoot_sound)){
	scr_sound_set_distance(shoot_sound, shoot_sound_radius)
	
	if (!shoot){
		audio_stop_sound(shoot_sound);
		shoot_sound = noone;
	}
}

shoot_previous = shoot;