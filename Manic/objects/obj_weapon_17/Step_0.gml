if (!instance_exists(obj_player)){
	return;
}

if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	return;
}

var mdir = point_direction(global.player_position_x, global.player_position_y, scr_input_get_mouse_x(), scr_input_get_mouse_y());
sprite_index = spr_weapon_17;

if (use_current){
	if (scr_input_is_down(InputBinding.Attack)){
        if (shoot_can) && (global.weapon_slot_standalone_ammo > 0) && (global.player_stamina_active){
            scr_effect_screenshake(2);
			scr_player_flash(5);
			scr_player_flashlight_flash(1.185);
			scr_sound_play(snd_weapon_shoot_6, false, 0.6, 0.9);
            scr_weapon_ammo_use(1);
			ammo = global.weapon_slot_standalone_ammo;
			
            var xpos = x + lengthdir_x(21, mdir) + lengthdir_y(1, up(mdir));
	        var ypos = y + lengthdir_y(21, mdir) + lengthdir_y(1, up(mdir));
			image_speed = 1;
			
			part_type_direction(global.pt_smoke_4, mdir - 6, mdir + 6, 0, 0);
			for(var l = 0; l < 16; l += 4){
				part_particles_create(global.ps_front, xpos + lengthdir_x(-10 + l, mdir) + random_range(-3, 3), ypos + lengthdir_y(-10 + l, mdir) + random_range(-3, 3), global.pt_smoke_4, 1);
			}
			
			part_type_direction(global.pt_shell_0, (mdir - 180) - 15, (mdir - 180) + 15, 0, 0);
			part_particles_create(global.ps_bottom, x + lengthdir_x(3, mdir) + random_range(-3, 3), y + 4 + lengthdir_y(3, mdir) + random_range(-3, 3), global.pt_shell_0, choose(2, 3));
			scr_mouse_control(MouseType.Crosshair, 2.5, 15);
			
		    var shoot = instance_create(xpos, ypos, obj_proj_0);
			shoot.damage = shoot_damage;
			shoot.strength = shoot_strength;
		    shoot.dir = mdir + random_range(-shoot_range, shoot_range);
			shoot.spd = 20;
			shoot.image_angle = shoot.dir;
            
            shoot_can = false;
            shoot_time = 5;
            shoot_bounceback = -8;
        }
    }
	
	if (scr_input_is_pressed(InputBinding.Attack)){
		if (global.weapon_slot_standalone_ammo <= 0) || (!global.player_stamina_active){
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
if (distance_to_object(obj_player) < pickup_range){
	pickup = true;
	
	if (global.player_stamina_active){
		if (!use_current){
			sprite_index = spr_weapon_17_interact;
			scr_ui_control_indicate(global.weapon_name[index]);
		}else{
			scr_ui_control_indicate("Demount " + string(global.weapon_name[index]));
		}
	}
}else{
	pickup = false;
}

if (instance_exists(obj_player)) && (global.player_stamina_active){
    
    // Pick up if player is near and E is pressed.
	var mount = scr_input_is_pressed(InputBinding.Interact);
	
    if (pickup){
		/*if (!use_current){
			with(obj_controller_ui){
				if (other.index != weaponinfo_index_prev){
					weaponinfo = true;
					weaponinfo_index = other.index;
					weaponinfo_ammo = (other.ammo != -1 ? other.ammo : global.weapon_ammomax[other.index]);
					weaponinfo_quantity = -1;
				}
			}
		}*/
		
        if (mount){
			scr_player_stamina_drain(6);
			
			if (!use_current){
				scr_sound_play(snd_weapon_pickup_gun, false, 0.8, 1.2);
				use_current = true;
				global.weapon_slot_standalone = index;
	            alarm[0] = 3;
				
				if (ammo == -1){
					ammo = global.weapon_ammomax[index];
				}
				
				global.weapon_slot_standalone_ammo = ammo;
			}else{
				use_current = false;
				global.weapon_slot_standalone = -1;
			}
        }
    }
}
