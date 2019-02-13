if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	exit;
}

var mdir = point_direction(x, y, mouse_x, mouse_y);

if (global.game_pause == false) && (global.weapon_slotammo[global.weapon_slotcurrent] > 0){ // If the mouse left button is pressed and the game is not paused.
	
    if (mouse_check_button_pressed(mb_left)) && (shoot_can == true){ // If the ammo is greater then one and the canshoot value is true.
        
		scr_player_knockback_initiate(0.5, mdir);
		scr_camera_to_player();
		scr_player_flash(4);
		scr_ui_alpha_reset();
        scr_effect_screenshake(2);
        scr_sound_play(snd_weapon_shoot_2, false, 0.8, 1.2);
        scr_weapon_ammo_use(index, 1);
        
        var xpos = x + lengthdir_x(20, mdir) + lengthdir_x(6, up(mdir));
        var ypos = y + lengthdir_y(20, mdir) + lengthdir_y(6, up(mdir));
		image_speed = 1 ;
		
        part_type_direction(global.pt_smoke_5, mdir - 17, mdir + 17, 0, 0);
        repeat(1) part_particles_create(global.ps_front, xpos + lengthdir_x(10, mdir) + random_range(-3, 3), ypos + lengthdir_y(10, mdir) + random_range(-3, 3), global.pt_smoke_5, 1);
		scr_mouse_control(MouseType.SmallCrosshair, 2.5, 15);
		
		if (!collision_line(x, y, xpos, ypos, obj_p_solid, false, true)){
	        shoot = instance_create(xpos, ypos, obj_proj_6);
			shoot.damage = shoot_damage;
			shoot.strength = shoot_strength;
	        shoot.dir = mdir + random_range(-shoot_range, shoot_range);
			shoot.spd = shoot_speed;
			shoot.image_angle = shoot.dir;
		}
		
        shoot_can = false;
        shoot_time = 17; // The amount of frames in between the next shot.
        shoot_bounceback = -3; // Bounce the weapon sprite back a few pixels.
        angle_offset = 11;
    }
}

// Throwing Weapon
var mdir = point_direction(x, y, mouse_x, mouse_y);

if (global.player_stamina_active == true){
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
		    throw.ammo = global.weapon_slotammo[global.weapon_slotcurrent]; // Set the ammo of the weapon drop to the ammo of this weapon. That way, when picked up again, it will have the same ammo reading.
			throw.ammodetermined = true;

		    instance_destroy();
		    global.weapon_slot[global.weapon_slotcurrent]=-1;
		}
    }
}

//Timer
if (shoot_time > 0){
    shoot_time--;
	
	if (within(shoot_time, 10, 11)){
		
		if (!audio_is_playing(snd_weapon_reload_0)){
			scr_sound_play(snd_weapon_reload_0, false, 0.9, 1.2);
		}
	}
	
}else{
    shoot_can = true;
}

