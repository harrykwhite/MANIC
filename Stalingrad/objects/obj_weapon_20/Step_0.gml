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

var mdir = point_direction(x, y, mouse_x, mouse_y);

if (mouse_check_button(mb_left)) && (!global.game_pause){
    if (shoot_can) && (global.weapon_slotammo[global.weapon_slotcurrent] > 0){
        scr_player_knockback_initiate(0.1, mdir);
		scr_player_flash(5);
		scr_ui_alpha_reset();
        scr_weapon_ammo_use(index, 1);
		image_speed = 1;
		
		if (!started){
			started = true;
			scr_sound_play(snd_weapon_flamethrower_start_0, false, 0.8, 1.2);
		}
		
		if (!audio_is_playing(shoot_onsound)){
			shoot_onsound = scr_sound_play(snd_weapon_flamethrower_active_0, true, 1, 1);
		}
		
        var xpos = x + lengthdir_x(24, mdir) + lengthdir_x(2, up(mdir));
        var ypos = y + lengthdir_y(24, mdir) + lengthdir_y(2, up(mdir));
		var dir = point_direction(xpos, ypos, mouse_x, mouse_y);
		
		part_type_direction(global.pt_flash_0, dir - 15, dir + 15, 0, 0);
		part_particles_create(global.ps_front, xpos + random_range(-3, 3), ypos + random_range(-3, 3), global.pt_flash_0, 1);
        part_type_direction(global.pt_smoke_5, dir - 15, dir + 15, 0, 0);
		part_particles_create(global.ps_front, xpos + lengthdir_x(8, dir) + random_range(-3, 3), ypos + lengthdir_y(8, dir) + random_range(-3, 3), global.pt_smoke_5, 1);
		scr_mouse_control(MouseType.LargeCircle, 2, 20);
		
		repeat(choose(2, 4)){
			shoot = instance_create(xpos, ypos, obj_proj_5);
		    shoot.dir = dir + random_range(-shoot_range, shoot_range);
			shoot.image_angle = shoot.dir;
			shoot.damage = shoot_damage;
			shoot.strength = shoot_strength;
			shoot.spd = random_range(10, 15);
		}
        
        shoot_can = false;
        shoot_time = 4;
        shoot_bounceback = -1;
        angle_offset = 1;
        flash_draw = true;
		flash_time = 0;
    }
}else{
	started = false;
	
	if (audio_is_playing(shoot_onsound)){
		audio_stop_sound(shoot_onsound);
	}
}

// Throwing Weapon
var mdir = point_direction(x, y, mouse_x, mouse_y);

if (global.player_stamina_active){
    if (mouse_check_button_pressed(mb_right)){
		if (!collision_line(x, y, x + lengthdir_x(10, mdir), y + lengthdir_y(10, mdir), obj_p_solid, false, true)){
		    scr_effect_screenshake(1);
			scr_player_stamina_drain(20);
			scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
		
		    throw = instance_create(x, y, obj_weapondrop);
		    throw.index = index;
		    throw.spd = 9;
		    throw.damage = throw_damage;
		    throw.dir = mdir;
		    throw.image_angle = throw.dir;
		    throw.ammo = global.weapon_slotammo[global.weapon_slotcurrent];
			throw.ammodetermined = true;

		    instance_destroy();
		    global.weapon_slot[global.weapon_slotcurrent] = -1;
		}
    }
}

// Time
if (shoot_time > 0){
    shoot_time--;
}else{
    shoot_can = true;
}

