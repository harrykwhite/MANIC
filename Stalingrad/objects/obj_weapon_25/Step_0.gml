if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	exit;
}

var mdir = point_direction(x, y, mouse_x, mouse_y);

if ((mouse_check_button_pressed(mb_left)) || (shoot_continue_time > 0)) && (!global.game_pause){
    if ((shoot_can) && (global.weapon_slotammo[global.weapon_slotcurrent] > 0)) || (shoot_continue_time > 0){
        var xpos = x + lengthdir_x(19, mdir) + lengthdir_x(3, up(mdir));
	    var ypos = y + lengthdir_y(19, mdir) + lengthdir_y(3, up(mdir));
		var dir = point_direction(xpos, ypos, mouse_x, mouse_y);
		
		if (mouse_check_button_pressed(mb_left) && (shoot_continue_time <= 0)){
			shoot_continue_time = 4;
			shoot_bounceback = -5;
			angle_offset = 20;
			scr_weapon_ammo_use(index, 1);
			scr_player_flash(8);
			scr_camera_to_player();
			scr_sound_play(snd_weapon_shoot_0, false, 0.8, 1.2);

	        part_type_direction(global.pt_flash_0, dir - 25, dir + 25, 0, 0);
			repeat(2) part_particles_create(global.ps_front, xpos + random_range(-3, 3), ypos + random_range(-3, 3), global.pt_flash_0, 1);
	        part_type_direction(global.pt_smoke_5, dir - 25, dir + 25, 0, 0);
			part_particles_create(global.ps_front, xpos + lengthdir_x(10, dir) + random_range(-3, 3), ypos + lengthdir_y(10, dir) + random_range(-3, 3), global.pt_smoke_5, 1);
		}
		
		scr_player_knockback_initiate(0.5, mdir);
        scr_effect_screenshake(2);
        scr_mouse_control(MouseType.LargeCircle, 3, 12);
		
        image_speed = 1;
        
		repeat(3){
		    shoot = instance_create(xpos, ypos, obj_proj_0);
			shoot.damage = shoot_damage + choose(0, 0, 1);
			shoot.strength = shoot_strength;
		    shoot.dir = dir + random_range(-shoot_range, shoot_range);
			shoot.spd = 18;
			shoot.image_angle = shoot.dir;
		}
        
        shoot_can = false;
        shoot_time = 65;
		
    }else{
		scr_sound_play(snd_weapon_click_0, false, 0.8, 1);
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

// Timer
if (shoot_continue_time > 0){
	shoot_continue_time --;
}

if (shoot_time > 0){
    shoot_time --;
	
	if (within(shoot_time, 26, 28)){
		
		if (!audio_is_playing(snd_weapon_reload_0)){
			scr_sound_play(snd_weapon_reload_0, false, 0.9, 1.2);
		}
	}
	
}else{
    shoot_can = true;
}

