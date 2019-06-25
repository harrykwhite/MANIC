if (demount) && (!global.game_pause){
	scr_player_stamina_drain(6);
	use_current = false;
	global.weapon_slot_standalone = -1;
	weapon_slot_standalone = -1;
	demount = false;
}

if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	return;
}

var mdir = point_direction(x, y, mouse_x, mouse_y);
sprite_index = spr_weapon_29;

if (use_current){
    if (mouse_check_button(obj_controller_all.key_attack)){
        if (shoot_can) && (global.weapon_slot_standalone_ammo > 0){
            scr_effect_screenshake(2);
			scr_player_flash(6);
			scr_sound_play(snd_weapon_shoot_2, false, 0.6, 0.9);
            scr_weapon_ammo_use(1);
			scr_mouse_control(MouseType.Crosshair, 2.5, 15);
			
            var xpos = x + lengthdir_x(12, mdir);
	        var ypos = y + lengthdir_y(12, mdir);
			image_speed = 1;
			
	        var dir = point_direction(xpos, ypos, mouse_x, mouse_y);
			part_type_direction(global.pt_smoke_4, dir - 6, dir + 6, 0, 0);
			part_particles_create(global.ps_front, xpos + lengthdir_x(3, dir) + random_range(-3, 3), ypos + lengthdir_y(3, dir) + random_range(-3, 3), global.pt_smoke_4, 2);
		    part_type_direction(global.pt_shell_0, (dir - 180) - 15, (dir - 180) + 15, 0, 0);
			part_particles_create(global.ps_bottom, x + lengthdir_x(3, dir) + random_range(-3, 3), y + 4 + lengthdir_y(3, dir) + random_range(-3, 3), global.pt_shell_0, choose(2, 3));
			
			var shoot = instance_create(xpos, ypos, obj_proj_0);
			shoot.damage = shoot_damage;
			shoot.strength = shoot_strength;
		    shoot.dir = dir + random_range(-shoot_range, shoot_range);
			shoot.spd = 20;
			shoot.image_angle = shoot.dir;
            
            shoot_can = false;
            shoot_time = 7;
            shoot_bounceback = -4;
        }
    }
	
	if (mouse_check_button_pressed(obj_controller_all.key_attack)){
		if (global.weapon_slot_standalone_ammo <= 0){
			scr_sound_play(snd_weapon_click_0, false, 0.8, 1);
		}
	}
}else{
	image_angle = 0;
	image_yscale = 1;
}

// Timer
if (shoot_time > 0){
    shoot_time--;
}else{
    shoot_can = true;
}

if (interact) && (!use_current){
	sprite_index = spr_weapon_29_interact;
	
	if (interact_activate){
		scr_player_stamina_drain(6);
		audio_play_sound(snd_weapon_pickup_0, 3, false);
		use_current = true;
		global.weapon_slot_standalone = index;
		alarm[0] = 3;

		if (ammo == -1){
			ammo = global.weapon_ammomax[global.weapon_slot_standalone];
			global.weapon_slot_standalone_ammo = ammo;
		}
		interact_activate = false;
		interact = false;
	}
}