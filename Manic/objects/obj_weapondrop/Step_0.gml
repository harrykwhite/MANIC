if (global.cutscene_current == -1){
	is_cutscene = false;
}

if (global.game_pause) || (global.cutscene_current != -1){
	if (!global.game_pause) && (!is_cutscene){
		return;
	}
}

var hit = false;

if (spd > 0){
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
	
	spd -= 0.35;
	spd = max(0, spd);
	
	image_alpha = 0;
	
	if (!is_cutscene){
		for(var i = 0; i < spd + 20; i ++){
			if (collision_line(xprevious, yprevious, x + lengthdir_x(i, dir), y + lengthdir_y(i, dir), obj_p_solid, false, true)){
				hit = true;
			}
		}
	}
}

angle += (spd * 2);

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
if (instance_exists(obj_player)){
	if (time < 20){
		time ++;
	}else{
	    if (distance_to_object(obj_player) < pickup_range){
	        pickup = true;
			scr_ui_control_indicate(string(global.weapon_name[index]) + "");
	    }else{
	        pickup = false;
	    }
	}
	
	if (global.weapon_slot_standalone != -1){
		pickup = false;
	}
    
    if (pickup){
        if (keyboard_check_pressed(obj_controller_all.key_interact)) && (global.player_stamina_active){
			if (global.weapon_slot_standalone == -1){
	            
				var oldweapon = global.weapon_slot[global.weapon_slotcurrent];
				var exists = false;
				var dropammo = global.weapon_slotammo[global.weapon_slotcurrent];
				var sound = snd_weapon_pickup_1;
				
				if (global.weapon_type[index] == WeaponType.Ranged){
					sound = snd_weapon_pickup_0;
				}
				
				scr_sound_play(sound, false, 0.8, 1.2);
				scr_player_stamina_drain(6);
				
				obj_controller_mouse.mouse_scale = 2;
				
				for(var i = 0; i < 2; i ++){
					if (global.weapon_slot[i] == index){
						if (i != global.weapon_slotcurrent){
							with(obj_controller_gameplay){ scr_weapon_switch(true, i); }
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
						
						obj_controller_ui.weaponslot_shake = 4;
			            obj_controller_ui.weaponslot_weaponscale[i] = 0;    
						
						return;
					}
				}
				
	            obj_controller_ui.weaponslot_shake = 4;
	            obj_controller_ui.weaponslot_weaponscale[global.weapon_slotcurrent] = 0;
				
				if (oldweapon != -1){
					if (instance_exists(global.weapon_object[oldweapon])){
						instance_destroy(global.weapon_object[oldweapon]); // Destroy the old weapon.
			        }
				}
				
				global.weapon_slot[global.weapon_slotcurrent] = index;
				var weapon_dropindex;
				
				if (!exists){
					weapon_dropindex = oldweapon;
				}else{
					weapon_dropindex = index;
				}
				
				if (weapon_dropindex != 4) && (weapon_dropindex != -1){ // If it is not a knife or empty.
					var drop = instance_create(obj_player.x + random_range(-6, 6), obj_player.y + random_range(-6, 6), obj_weapondrop); // Create a weapondrop object, with it being a drop of the old weapon.
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
				
	            instance_destroy(); // Destroy this weapondrop object as it has been picked up.
				
				if (global.level_current == Level.Prologue){
					if (obj_controller_ui.tutourial_stage == TutourialStage.Pickup) && (index == PlayerWeapon.HuntingRifle){
						obj_controller_ui.tutourial_stage = TutourialStage.Shoot;
						obj_controller_ui.tutourial_scale = 1.3;
					}else if (index == PlayerWeapon.Sickle){
						if (obj_controller_ui.tutourial_stage == TutourialStage.PickupMelee){
							obj_controller_ui.tutourial_stage = TutourialStage.Switch;
							obj_controller_ui.tutourial_scale = 1.3;
						}else{
							obj_controller_ui.tutourial_stage_pickupmelee_equipped = true;
						}
					}
				}
				
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
								return;
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