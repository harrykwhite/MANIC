var wcurrent = global.weapon_slot[global.weapon_slotcurrent];

if (global.weapon_slot_standalone != -1){
	wcurrent = global.weapon_slot_standalone;
}

image_alpha = 1;

if (instance_exists(obj_player)) && (wcurrent!= -1){
    
	if (obj_player.state == scr_player_dash){
        image_alpha = 0;
		exit;
    }
	
	if (global.game_pause){
		image_alpha = 1;
		exit;
	}
	
	if (obj_player.move_xTo == -1) && (obj_player.move_yTo == -1) && (global.cutscene_current == -1){
		
		// Bobbing -----------------------------------------------------------------------------------------------------
	    var img = floor(obj_player.img_index);
    
	    // IDLE
	    if (obj_player.hspd == 0) && (obj_player.vspd == 0) && (obj_player.state == scr_player_move){
	        if (img == 1){
	            yoffset = 1;
	        }else{
	            yoffset = 0;
	        }
	    }else if (obj_player.state == scr_player_move) && (!obj_player.move_back){
    
	        // MOVE
	        if (img == 2) || (img == 4) || (img == 9) || (img == 11){
	            yoffset = 1;
	        }else if (img == 3) || (img == 10){
	            yoffset = 2;
	        }else{
	            yoffset = 0;
	        }
	    }else if (obj_player.move_back){
    
	        // BACKWARDS
	        if (img == 0) || (img == 2) || (img == 7) || (img == 9){
	            yoffset = 1;
	        }else if (img == 1) || (img == 8){
	            yoffset = 2;
	        }else{
	            yoffset = 0;
	        }
	    }
    
	    // Weapon Position -------------------------------------------------------------------------------------------------
	    var dir = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
		
		if ((global.weapon_type[wcurrent] == WeaponType.Ranged)
		|| (global.weapon_type[wcurrent] == WeaponType.Throwing)
		|| (global.weapon_object[wcurrent].index == PlayerWeapon.Knife)
		|| (global.weapon_object[wcurrent].index == PlayerWeapon.Rake)
		|| (global.weapon_object[wcurrent].index == PlayerWeapon.Spear))
		and ((global.weapon_object[wcurrent].index != PlayerWeapon.MountedMachineGun)
		and (global.weapon_object[wcurrent].index != PlayerWeapon.MountedMachineGunCart)){
			if (obj_player.image_xscale == 1){
				dir += global.weapon_object[wcurrent].start_offset;
			}else{
				dir -= global.weapon_object[wcurrent].start_offset;
			}
		}
		
		if (instance_exists(global.weapon_object[wcurrent])){
	        draw = true;
			image_index = 0;
			
	        if (global.weapon_type[wcurrent] != WeaponType.Melee){
	            if (global.weapon_heavy[wcurrent]){
	                image_index = 2;
	            }
			}
			
			if (global.weapon_dualhanded[wcurrent]){
				image_index = 1;
			}
			
	        if (obj_player.image_xscale == 1){
	            x = obj_player.x - 3;
	            y = (obj_player.y - 4) + yoffset;
            
				if (obj_player.move_xTo == -1) && (obj_player.move_yTo == -1){
					if (global.weapon_type[wcurrent] == WeaponType.Throwing){
						image_angle = dir + global.weapon_object[wcurrent].throw_offset;
					}else{
						image_angle = dir;
					}
				}else{
					image_angle = 0;
				}
			
	            image_yscale = 1;
            
	        }else{
	            x = obj_player.x + 3;
	            y = (obj_player.y - 4)+yoffset;
            
				if (obj_player.move_xTo == -1) && (obj_player.move_yTo == -1){
					if (global.weapon_type[wcurrent] == WeaponType.Throwing){
						image_angle = dir - global.weapon_object[wcurrent].throw_offset;
					}else{
						image_angle = dir;
					}
				
				}else{
					image_angle = 0;
				}
			
				image_yscale = -1;
	        }
	    }
		
	}else{
		image_alpha = 0;
	}
    
}else{
    image_alpha = 0;
}