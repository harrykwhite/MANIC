if (global.game_pause) || (global.cutscene_current != -1){
	exit;
}

var hit = false;
time++;

if (spd > 0){
	spd = max(0, spd);
	image_alpha = 0;

	for(var i = 0; i < spd + 20; i++){
		if (collision_line(xprevious, yprevious, x + lengthdir_x(i, dir), y + lengthdir_y(i, dir), obj_p_solid, false, true)){
			hit = true;
		}
	}
}

if (spd > 0){
	spd -= 0.35 ;
	scr_motion_control(false);
}else{
	spd = 0;
}

angle += (spd * 2) ;

if (hit){
	if (bounce_time <= 0) && (spd > 0){
		scr_effect_screenshake(1);
		dir = dir - 180;
		spd *= 0.75;
		bounce_time = 10;
	}
}

if (bounce_time > 0){
    bounce_time--;
}

// Pickup
if (instance_exists(global.player)){
	
    if (distance_to_object(global.player) < pickup_range){
        pickup = true;
		scr_ui_control_indicate(string(global.weapon_name[index]) + " [E]");
    }else{
        pickup = false;
    }
	
	if (global.weapon_slot_standalone != -1){
		pickup = false;
	}
    
    if (pickup){
        if (keyboard_check_pressed(ord("E"))) && (global.player_stamina_active){
			if (global.weapon_slot_standalone == -1){
	            
				var oldweapon = global.weapon_slot[global.weapon_slotcurrent];
				var exists = false;
				var dropammo = global.weapon_slotammo[global.weapon_slotcurrent];;
				var alength = array_length_1d(global.weapon_slot);
				var sound = snd_weapon_pickup_1;
				
				if (global.weapon_type[index] == WeaponType.Ranged){
					sound = snd_weapon_pickup_0;
				}
				
				scr_sound_play(sound, false, 0.8, 1.2);
				scr_player_stamina_drain(6);
				scr_ui_alpha_reset();
				obj_controller_mouse.mouse_scale = 2;
				
				for(var i = 0; i < 2; i++){
					if (global.weapon_slot[i] == index){
						if (i != global.weapon_slotcurrent) {
							with(obj_controller_gameplay) { scr_weapon_switch(); }
						}
						
						if (global.weapon_type[index] == WeaponType.Ranged){
							var amm = ammo;
							
							ammo = global.weapon_slotammo[i];
							global.weapon_slotammo[i] = amm;
						}
						
						if (global.weapon_type[index] == WeaponType.Throwing){
							global.weapon_quantity[global.weapon_slot[i]] += quantity;
							global.weapon_quantity[global.weapon_slot[i]] = max(global.weapon_quantity[global.weapon_slot[i]], 1);
							instance_destroy();
						}
						
						if (instance_exists(obj_controller_ui)){
			                obj_controller_ui.weaponslot_shake = 3;
			                obj_controller_ui.weaponslot_scale[i] = 0;
			            }
						
						exit;
					}
				}
				
				if (instance_exists(obj_controller_ui)){
	                obj_controller_ui.weaponslot_shake = 3;
	                obj_controller_ui.weaponslot_scale[global.weapon_slotcurrent] = 0;
	            }
				
				if (instance_exists(global.weapon_object[oldweapon])){
					with(global.weapon_object[oldweapon]) instance_destroy(); // Destroy the old weapon.
		        }
				
				global.weapon_slot[global.weapon_slotcurrent] = index;
				var weapon = instance_create(x, y, global.weapon_object[index]); // Create the new weapon.
				var weapon_dropindex;
				
				if (!exists){
					weapon_dropindex = oldweapon;
				}else{
					weapon_dropindex = index;
				}
				
				if (weapon_dropindex != 4) && (weapon_dropindex != -1){ // If it is not a knife.
					var drop = instance_create(global.player.x + random_range(-6, 6), global.player.y + random_range(-6, 6), obj_weapondrop); // Create a weapondrop object, with it being a drop of the old weapon.
					drop.index = weapon_dropindex;
					drop.ammo = dropammo;
					drop.angle = angle + random_range(-30, 30);
					drop.ammodetermined = true;
					drop.drop = true;
					
					if (global.weapon_type[index] != WeaponType.Throwing) && (global.weapon_type[oldweapon] == WeaponType.Throwing){
						drop.quantity = global.weapon_quantity[oldweapon];
					}
				}
				
				if (global.weapon_type[index] == WeaponType.Throwing){
					global.weapon_quantity[index] = quantity;
				}
				
	            if (ammo != -1){ // Set the ammo of the new object, based on what it was originally.
					global.weapon_slotammo[global.weapon_slotcurrent] = ammo;
	            }
	
				global.weapon_collected[index] = true;
				global.weapon_slottime[global.weapon_slotcurrent] = 0;
				global.weapon_slottimeup[global.weapon_slotcurrent] = false;
				
	            instance_destroy(); // Destroy this weapondrop object as it has been picked up.
				
				with(obj_controller_mouse){
					mouse_alpha = 0.25;
					mouse_scale = 2;
				}
				
				with(obj_controller_gameplay){
					
					var isnew = true;
					
					if (ds_exists(weaponlist, ds_type_list)){
						
						var length = ds_list_size(weaponlist);
						
						for(var i = length - 1; i > -1; i--){
							
							if (weaponlist[| i] == other.index){
								isnew = false;
								exit;
							}
						}
						
						if (isnew){
							global.game_score_wpnvariation += 500;
							scr_points_display("WEAPON VARIATION 500+");
							weaponlist[| length] = other.index;
						}
					}
				}
			}
		}
    }
}