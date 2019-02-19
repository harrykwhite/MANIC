if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	exit;
}

var mdir = point_direction(x, y, mouse_x, mouse_y);
sprite_index = spr_weapon_17;

if (use_current){
    if (mouse_check_button(mb_left)){
        if (shoot_can ) && (global.weapon_slot_standalone_ammo > 0){
            scr_effect_screenshake(2);
			scr_player_flash(6);
			scr_sound_play(snd_weapon_shoot_2, false, 0.6, 0.9);
            scr_weapon_ammo_use(index, 1);
			scr_ui_alpha_reset();
            
            var xpos = x + lengthdir_x(12, mdir);
	        var ypos = y + lengthdir_y(12, mdir);
			image_speed = 1 ;
			
	        var dir = point_direction(xpos, ypos, mouse_x, mouse_y);
			part_type_direction(global.pt_flash_0, dir - 17, dir + 17, 0, 0);
			repeat(1) part_particles_create(global.ps_front, xpos + lengthdir_x(10, dir) + random_range(-3, 3), ypos + lengthdir_y(10, dir) + random_range(-3, 3), global.pt_flash_0, 1);
			part_type_direction(global.pt_smoke_5, dir - 17, dir + 17, 0, 0);
			repeat(1) part_particles_create(global.ps_front, xpos + lengthdir_x(10, dir) + random_range(-3, 3), ypos + lengthdir_y(10, dir) + random_range(-3, 3), global.pt_smoke_5, 1);
			scr_mouse_control(MouseType.Crosshair, 2.5, 15);
			
			if (!collision_line(x, y, xpos, ypos, obj_p_solid, false, true)){
		        shoot = instance_create(xpos, ypos, obj_proj_0);
				shoot.damage = shoot_damage;
				shoot.strength = shoot_strength;
		        shoot.dir = dir + random_range(-shoot_range, shoot_range);
				shoot.spd = 20;
				shoot.image_angle = shoot.dir;
			}
            
            shoot_can = false;
            shoot_time = 7;
            shoot_bounceback = -4;
        }
    }
	
	if (mouse_check_button_pressed(mb_left)){
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

// Pickup and Put Down
if (distance_to_object(global.player) < pickup_range){
	pickup = true;
	
	if (!use_current){
		sprite_index = spr_weapon_17_interact;
		scr_ui_control_indicate(global.weapon_name[index] + " [E]");
	}
}else{
	pickup = false;
}

if (instance_exists(global.player)) && (global.player_stamina_active){
    
    // Pick up if player is near and E is pressed.
	var mount = keyboard_check_pressed(ord("E"));
	var bossActivate = false;
	
    if (pickup){
        if (mount){
			if (!use_current){
				scr_player_stamina_drain(6);
				audio_play_sound(snd_weapon_pickup_0, 3, false);
				use_current = true;
				global.weapon_slot_standalone = index;
	            alarm[0] = 3;
				
				if (ammo == -1){
					ammo = global.weapon_ammomax[global.weapon_slot_standalone];
					global.weapon_slot_standalone_ammo = ammo;
				}
				
				if (bossActivate){
					if (global.game_objective_current == 0){
						global.game_objective_current = 1;
						with(scr_get_level_object()){
							spawn_time = 60 * 2.5;
						}
					}
				}
			}else{
				if (!bossActivate){
					scr_player_stamina_drain(6);
					use_current = false;
					global.weapon_slot_standalone = -1;
					weapon_slot_standalone = -1;
				}
			}
        }
		
    }
}
