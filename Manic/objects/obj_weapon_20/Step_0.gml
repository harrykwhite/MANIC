if (!instance_exists(obj_player)){
	instance_destroy();
	return;
}

if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	return;
}

var mdir = point_direction(global.player_position_x, global.player_position_y, scr_input_get_mouse_x(), scr_input_get_mouse_y());

if (scr_input_is_down(InputBinding.Attack)) && (!global.game_pause){
    if (shoot_can) && (global.weapon_slotammo[global.weapon_slotcurrent] > 0) && (global.player_stamina_active){
		var xpos = x + lengthdir_x(24, mdir) + lengthdir_x(2, up(mdir));
        var ypos = y + lengthdir_y(24, mdir) + lengthdir_y(2, up(mdir));
		
		scr_player_knockback_initiate(0.1, mdir);
		
        scr_weapon_ammo_use(1);
		image_speed = 1;
		
		if (!started){
			started = true;
			scr_sound_play(snd_weapon_flamethrower_start_0, false, 0.8, 1.2);
		}
		
		if (!audio_is_playing(shoot_onsound)){
			shoot_onsound = scr_sound_play(snd_weapon_flamethrower_active_0, true, 1, 1);
		}
		
		part_type_direction(global.pt_smoke_4, mdir - 6, mdir + 6, 0, 0);
		for(var l = 0; l < 20; l += 4){
			part_particles_create(global.ps_front, xpos + lengthdir_x(-10 + l, mdir) + random_range(-3, 3), ypos + lengthdir_y(-10 + l, mdir) + random_range(-3, 3), global.pt_smoke_4, 1);
		}
		
		part_type_direction(global.pt_shell_0, (mdir - 180) - 15, (mdir - 180) + 15, 0, 0);
        part_particles_create(global.ps_bottom, x + lengthdir_x(3, mdir) + random_range(-3, 3), y + 4 + lengthdir_y(3, mdir) + random_range(-3, 3), global.pt_shell_0, 1);
		scr_mouse_control(MouseType.LargeCircle, 2, 20);
		
		repeat(choose(2, 4)){
			var shoot = instance_create(xpos, ypos, obj_proj_5);
		    shoot.dir = mdir + random_range(-shoot_range, shoot_range);
			shoot.image_angle = shoot.dir;
			shoot.damage = shoot_damage;
			shoot.strength = shoot_strength;
			shoot.spd = random_range(10, 15);
		}
        
        shoot_can = false;
        shoot_time = 4;
        shoot_bounceback = -3;
        angle_offset = 1;
		
        flash_draw = true;
		flash_time = 0;
    }else if (global.weapon_slotammo[global.weapon_slotcurrent] <= 0){
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

if (started){
	scr_player_flash(5);
	scr_player_flashlight_flash(1.175);
}

// Throwing Weapon
var mdir = point_direction(global.player_position_x, global.player_position_y, scr_input_get_mouse_x(), scr_input_get_mouse_y());

if (global.player_stamina_active){
    if (scr_input_is_pressed(InputBinding.Throw)){
		if (!collision_line(x, y, x + lengthdir_x(16, mdir), y + lengthdir_y(16, mdir), obj_p_solid, false, true)){
		    scr_effect_screenshake(1);
			scr_player_stamina_drain(20);
			scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
		
		    throw = instance_create(x, y, obj_weapondrop);
		    throw.index = index;
		    throw.spd = 9;
		    throw.damage = throw_damage;
		    throw.dir = mdir;
		    throw.angle = image_angle;
		    throw.ammo = global.weapon_slotammo[global.weapon_slotcurrent];
			throw.dataset = true;

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

