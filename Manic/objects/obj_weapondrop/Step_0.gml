if (global.game_pause){
	return;
}

if (alpha < 1){
	alpha += 0.1;
}

if (global.cutscene_current == -1){
	is_cutscene = false;
}

if (global.cutscene_current != -1){
	if (!is_cutscene){
		return;
	}
}

if (index == PlayerWeapon.Grenade) || (index == PlayerWeapon.ToxicGrenade) || (index == PlayerWeapon.ReinforcedGrenade) || (index == PlayerWeapon.LandMine){
	pack = true;
}

// Motion and Bouncing
var tweapon = instance_place(x, y, obj_weapondrop);

if (tweapon != noone){
	pushaway_dir = point_direction(x, y, tweapon.x, tweapon.y) - 180;
	
	if (pushaway_speed < pushaway_speed_max){
		pushaway_speed += 0.2;
	}
}else{
	if (pushaway_speed > 0){
		pushaway_speed -= 0.2;
	}
}

if (pushaway_speed > 0){
	var xjump = lengthdir_x(pushaway_speed, pushaway_dir);
	var yjump = lengthdir_y(pushaway_speed, pushaway_dir);
	
	if (!place_meeting(x + xjump + lengthdir_x(1, pushaway_dir), y + yjump + lengthdir_y(1, pushaway_dir), obj_p_solid)){
		x += xjump;
		y += yjump;
	}
}

if (spd > 0){
    spd -= 0.3;
	
	scr_motion_control(false);
	angle += (spd * 2);
	
	if (spd > 0){
		if (bounce_time <= 0){
			var touched = false;
			
			if (place_meeting(x + lengthdir_x(spd, dir), y, obj_p_solid)){
				dir = 180 - dir;
				touched = true;
			}
			
			if (place_meeting(x, y + lengthdir_y(spd, dir), obj_p_solid)){
			    dir = -dir;
				touched = true;
			}
			
			if (touched){
			    spd *= 0.75;
			}
	
		}
	}
}else{
    spd = 0;
}

if (bounce_time > 0){
    bounce_time--;
}

// Burn
if (burn && canburn){
	if (burn_time > 0){
		burn_time --;
	}else{
		kill = true;
	}
	
	var lenp = random_range(7, 25);
	var lenop = random(3) * choose(-1, 1);
	var xp = x + lengthdir_x(lenp, angle) - lengthdir_x(10, angle);
	var yp = y + lengthdir_y(lenp, angle) - lengthdir_y(10, angle);
	xp += lengthdir_x(lenop, angle + 90);
	yp += lengthdir_y(lenop, angle + 90);
	
	if (random(3) < 1){
		part_particles_create(global.ps_front, xp, yp, global.pt_fire_0, 1);
	}
	
	if (random(5) < 1){
		part_particles_create(global.ps_front, xp, yp, global.pt_fire_2, 1);
	}
}else{
	burn = false;
	burn_time = burn_time_max;
}

// Kill
if (kill){
	instance_destroy();
	
	if (index == PlayerWeapon.Stick){
		scr_sound_play(snd_weapon_stick_break_0, false, 0.8, 1.2);
		
		var sticklen = 39;
		for(var thislen = -(sticklen / 2); thislen < (sticklen / 2); thislen += 3){
			part_particles_create(global.ps_bottom, x + lengthdir_x(thislen, angle), y + lengthdir_y(thislen, angle), global.pt_stick_break_0, 1);
			part_particles_create(global.ps_bottom, x + lengthdir_x(thislen, angle), y + lengthdir_y(thislen, angle), global.pt_stick_break_flash_0, 1);
		}
	}
}

/* Info draw
if (pickup){
	with(obj_controller_ui){
		if (other.index != weaponinfo_index_prev){
			weaponinfo = true;
			weaponinfo_index = other.index;
			weaponinfo_ammo = other.ammo;
			weaponinfo_quantity = other.quantity;
		}
	}
}*/

// Pickup
if (instance_exists(obj_player)){
	if (time < 20){
		time ++;
	}else{
	    if (point_distance(x, y, obj_player.x, obj_player.y) < pickup_range){
	        pickup = true;
	    }else{
	        pickup = false;
	    }
	}
	
	if (global.weapon_slot_standalone != -1){
		pickup = false;
	}
	
	if (global.cutscene_current != -1){
		pickup = false;
	}
    
    if (pickup){
		scr_ui_control_indicate(global.weapon_name[index]);
		
        if (scr_input_is_pressed(InputBinding.Interact)) && (global.player_stamina_active){
			if (global.weapon_slot_standalone == -1){
				var oldweapon = global.weapon_slot[global.weapon_slotcurrent];
				var dropammo = global.weapon_slotammo[global.weapon_slotcurrent];
				var dropquantity = global.weapon_slotquantity[global.weapon_slotcurrent];
				var sound = snd_weapon_pickup_melee;
				
				switch(global.weapon_type[index]){
					case WeaponType.Ranged:
						sound = snd_weapon_pickup_gun;
						break;
					
					case WeaponType.Throwing:
						sound = snd_weapon_pickup_throwable;
						break;
				}
				
				scr_sound_play(sound, false, 0.8, 1.2);
				scr_player_stamina_drain(6);
				
				obj_controller_mouse.mouse_scale = 2;
				
				if (index == PlayerWeapon.Knife){
					if (room == rm_prologue_00){
						if (obj_controller_ui.tutourial_stage == TutourialStage.PickupMelee){
							obj_controller_ui.tutourial_stage = TutourialStage.Switch;
							obj_controller_ui.tutourial_scale = 1.2;
							obj_controller_ui.tutourial_stage_timer = obj_controller_ui.tutourial_stage_timer_max;
						}else{
							obj_controller_ui.tutourial_stage_pickupmelee_equipped = true;
						}
					}
					
					if (oldweapon == -1 && global.weapon_default != -1){
						if (instance_exists(global.weapon_object[global.weapon_default])){
							instance_destroy(global.weapon_object[global.weapon_default]);
				        }
					}
					
					global.weapon_default = PlayerWeapon.Knife;
					instance_destroy();
					return;
				}
				
				if (index == PlayerWeapon.Bayonet){
					if (oldweapon == -1 && global.weapon_default != -1){
						if (instance_exists(global.weapon_object[global.weapon_default])){
							instance_destroy(global.weapon_object[global.weapon_default]);
				        }
					}
					
					global.weapon_default = PlayerWeapon.Bayonet;
					instance_destroy();
					return;
				}
				
				var slotcount = global.weapon_slotmax;
				var exists = false;
				
				for(var i = 0; i < slotcount; i ++){
					if (global.weapon_slot[i] == index){
						//if (i != global.weapon_slotcurrent){
						//	with(obj_controller_gameplay){ scr_weapon_switch(true, i); }
						//}
						
						exists = true;
						
						if (global.weapon_type[index] == WeaponType.Ranged){
							var amm = ammo;
							ammo = global.weapon_slotammo[i];
							global.weapon_slotammo[i] = amm;
						}
						
						if (global.weapon_type[index] == WeaponType.Throwing){
							global.weapon_slotquantity[i] += quantity;
							instance_destroy();
						}
						
						obj_controller_ui.weaponslot_shake[i] = 4;
			            obj_controller_ui.weaponslot_weaponscale[i] = 0;
						break;
					}
				}
				
				if (exists){
					return;
				}
				
	            // Destroy the current held weapon
				if (oldweapon != -1){
					if (instance_exists(global.weapon_object[oldweapon])){
						instance_destroy(global.weapon_object[oldweapon]);
			        }
				}else if (global.weapon_default != -1){
					if (instance_exists(global.weapon_object[global.weapon_default])){
						instance_destroy(global.weapon_object[global.weapon_default]);
			        }
				}
				
				// Set the slot of the weapon
				var foundempty = false;
				var emptycurrent = false;
				var newslotind = -1;
				
				for(var i = 0; i < slotcount; i ++){
					if (global.weapon_slot[i] == -1) || (global.weapon_slot[i] == global.weapon_default){
						global.weapon_slot[i] = index;
						newslotind = i;
						foundempty = true;
						
						if (i == global.weapon_slotcurrent){
							emptycurrent = true;
						}
						
						break;
					}
				}
				
				if (!foundempty){
					global.weapon_slot[global.weapon_slotcurrent] = index;
					newslotind = global.weapon_slotcurrent;
				}
				
				// Set the weapon index of the drop object
				var weapon_dropindex;
				
				if (!foundempty){
					weapon_dropindex = oldweapon;
				}else{
					weapon_dropindex = -1;
				}
				
				// Create the new weapon drop
				if (weapon_dropindex != global.weapon_default && weapon_dropindex != -1 && !foundempty){ // If it is not a default weapon or empty.
					var drop = instance_create(x, y, obj_weapondrop); // Create a weapondrop object, with it being a drop of the old weapon.
					drop.index = weapon_dropindex;
					drop.ammo = dropammo;
					drop.quantity = dropquantity;
					drop.angle = angle + random_range(-30, 30);
					drop.dataset = true;
					drop.drop = true;
					
					for(var i = array_length_1d(special) - 1; i >= 0; i --){
						if (drop.index == special[i]){
							drop.specialweapon = true;
							break;
						}
					}
				}
				
				// Shake effect
				obj_controller_ui.weaponslot_shake[newslotind] = 4;
	            obj_controller_ui.weaponslot_weaponscale[newslotind] = 0;
				
				// Set the new weapon quantity
				if (quantity != -1){
					global.weapon_slotquantity[newslotind] = quantity;
				}
				
				// Set the new ammo amount
	            if (ammo != -1){
					global.weapon_slotammo[newslotind] = ammo;
	            }
				
				global.weapon_collected[index] = true;
	            instance_destroy(); // Destroy this weapondrop object as it has been picked up.
				
				// If in the prologue, update the tutourial stage
				if (global.level_current == Level.Prologue){
					if (obj_controller_ui.tutourial_stage == TutourialStage.Pickup) && (index == PlayerWeapon.OldHuntingRifle){
						obj_controller_ui.tutourial_stage = TutourialStage.Shoot;
						obj_controller_ui.tutourial_scale = 1.2;
						obj_controller_ui.tutourial_stage_timer = obj_controller_ui.tutourial_stage_timer_max;
					}
				}
				
				// Scale the mouse
				with(obj_controller_mouse){
					mouse_alpha = 0.25;
					mouse_scale = 2;
				}
				
				// Create the new weapon object
				if (index != -1) && (!foundempty || emptycurrent){
					var new_wp_obj = instance_create(obj_player.x, obj_player.y, global.weapon_object[index]);
					new_wp_obj.image_angle = point_direction(global.player_position_x, global.player_position_y, scr_input_get_mouse_x(), scr_input_get_mouse_y());
					with(new_wp_obj){
						event_perform(ev_step_end, 0);
					}
					
					if (index == PlayerWeapon.Stick){
						new_wp_obj.burn = burn;
						new_wp_obj.burn_time = burn_time;
					}
				}
			}
		}
    }
}