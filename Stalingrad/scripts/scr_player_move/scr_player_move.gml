// Variables
var spd_multiplier = spd_offset;
var footstep_wood, footstep_road;

footstep_sound = global.player_footstep_default;

if (spd_offset > 1){
	spd_offset -= spd_offset_change;
}else if (spd_offset < 1){
	spd_offset += spd_offset_change;
}

// Minecart State
if (in_minecart){
	state = scr_player_minecart;
	exit;
}

// Main
if (global.weapon_slot_standalone == -1){
	
	// Axis
	xaxis = key_right - key_left;
	yaxis = key_down - key_up;
	
	dir = point_direction(0, 0, xaxis, yaxis);
	image_angle = 0;

	// Speed
	if (global.weapon_heavy[global.weapon_slot[global.weapon_slotcurrent]]){
	    spd_multiplier -= 0.1;
	}

	if (global.player_healthCurrent <= 2){
	    spd_multiplier += 0.1;
	}
	
	if (global.player_healthCurrent <= 4){
		spd_multiplier += 0.05;
	}

	if (global.player_stamina_active == false){
	    spd_multiplier -= 0.1;
	}
	
	if (burn_time > 0){
		spd_multiplier += 0.15;
	}

	// Footstep Sound
	if (global.level_current != 2) && (global.level_current != 4) && (room != rm_level_7_02){
		footstep_wood = layer_tilemap_get_id("InteriorFloorWood");
	
		if (layer_tilemap_exists(layer_get_id("InteriorFloorWood"), footstep_wood)){
			if (tilemap_get_at_pixel(footstep_wood, x, y + 18)){
				footstep_sound = snd_character_footstep_wood;
			}
		}
		
		if (room == rm_level_8_02){
			footstep_road = layer_tilemap_get_id("Road");
			if (layer_tilemap_exists(layer_get_id("Road"), footstep_road)){
				if (tilemap_get_at_pixel(footstep_road, x, y + 18)){
					footstep_sound = snd_character_footstep_wood;
				}
			}
		}
	}
	
	// Player Sprite
	if ((hspd != 0) || (vspd != 0)){
	
		if (footstep_time > 0){
			footstep_time--;
		}else{
			footstep_time = 36 * (1 - img_speed);
		
			// Play Footstep Sound
			if (footstep_sound != -1){
				scr_sound_play(footstep_sound, false, 0.8, 1.1);
			}
		}
		
	}else{
		
		footstep_time = 19;
	}

	if (len == 0) && (xaxis == 0) && (yaxis == 0){
	    move_back = false;

	    if (global.player_weapon!=-1){
	        if (global.weapon_heavy[global.player_weapon]==false){
	            sprite_index = spr_player_idle_0;
	        }else{
	            sprite_index = spr_player_idle_2;
	        }
        
	    }else{
	        sprite_index = spr_player_idle_1;
	    }
    
	}else{

	    // Movement
	    if ((image_xscale == 1) && (sign(hspd)==1)) || ((image_xscale==-1) && (sign(hspd)=-1)) || (hspd == 0){ // Forwards - checks if the player is facing the dir of their movement.
        
	        move_back = false;
        
	        if (global.player_weapon != -1){
	            if (global.weapon_heavy[global.player_weapon]==false){
	                sprite_index = spr_player_walk_0;
	            }else{
	                sprite_index = spr_player_walk_2;
	            }
            
	        }else{
	            sprite_index = spr_player_walk_1;
	        }
			
	    }else{
			
	        move_back = true;
	        spd_multiplier -= 0.2;
        
	        if (global.player_weapon!=-1){
	            if (global.weapon_heavy[global.player_weapon]==false){
	                sprite_index = spr_player_backwards_0;
	            }else{
	                sprite_index = spr_player_backwards_2;
	            }
            
	        }else{
	            sprite_index = spr_player_backwards_1;
	        }
	    }
	}

	// Knockback
	if (knockback ) && (move_xTo == -1) && (move_yTo == -1) && (global.cutscene_current == -1){
		for(var i = knockback_speed + 3; i > -1; i--){
		    if (place_meeting(x + lengthdir_x(i, knockback_direction), y + lengthdir_y(i, knockback_direction), obj_p_solid)) || (knockback_speed <= 0.2){
				knockback_speed = 0;
		        knockback = false;
				exit;
		    }
		}
		
		x += lengthdir_x(knockback_speed, knockback_direction);
		y += lengthdir_y(knockback_speed, knockback_direction);
    
	    knockback_speed *= 0.9;
	}else{
		knockback = false;
		knockback_speed = 0;
	}
	
	if (key_space) && (dash_time <= 0) && (global.cutscene_current == -1) && (move_xTo == -1) && (move_yTo == -1){
		dash_length = 55;
		dash_speed = spd_max * 3.65;
		dash_time = 20;
		scr_ui_alpha_reset();
		scr_effect_screenshake(2);
		scr_effect_vignette_flash(c_white, 0.064, 0.004);
		scr_sound_play(snd_character_dash_0, false, 0.8, 1.2);
		
	    dash_length_current = 0;
	    dash_direction = point_direction(0, 0, xaxis, yaxis);
		
		if (xaxis == 0) && (yaxis == 0){
			
			if (image_xscale == 1){
				dash_direction = 360;
			}else{
				dash_direction = 180;
			}
		}
		
	    state = scr_player_dash;
	    exit;
	}
	
	if (dash_time > 0){
		dash_time --;
	}

	// Movement
	if (move_xTo == -1) && (move_yTo == -1){
		if (global.cutscene_current == -1){
			if ((xaxis == 0) && (yaxis == 0)){
			    len = 0;
			}else{
			    if (len<(spd_max * spd_multiplier)){
			        len += spd_build * spd_multiplier;
			    }else if (len>(spd_max * spd_multiplier)){
			        len -= 0.05;
			    }
			}
			
			img_speed = (len * 0.165) * spd_multiplier;
		}else{
			len = 0;
			sprite_index = spr_player_idle_1;
			img_speed = 0.03;
		}
	}else{
		dir = point_direction(x, y, move_xTo, move_yTo);
		sprite_index = spr_player_walk_1;
		
		if (distance_to_point(move_xTo, move_yTo) < 7){
		    len = 0;
		}else{
			var spd = move_extSpd;
			
			if (spd == -1){
				spd = spd_max;
			}
			
		    if (len<(spd * spd_multiplier)){
		        len += spd_build * spd_multiplier;
		    }else if (len>(spd * spd_multiplier)){
		        len -= 0.05;
		    }
		}
		
		img_speed = (len * 0.165) * spd_multiplier;
	}
	
	if (len == 0) && (xaxis == 0) && (yaxis == 0){
		img_speed = 0.05;
	}
	
	vspd = lengthdir_y(len, dir);
	hspd = lengthdir_x(len, dir);
}else{
	sprite_index = spr_player_idle_2;
	img_speed = 0.05;
	
	hspd = 0;
	vspd = 0;
}

// Sprite Flip
if (move_xTo == -1) && (move_yTo == -1) && (global.cutscene_current == -1){
	if (mouse_x > x){
		image_xscale = 1;
	}else{
		image_xscale = -1;
	}
}

if (global.cutscene_current != -1){
	if (flashlight_direction < 90) || (flashlight_direction > 270){
		image_xscale = 1;
	}else if (flashlight_direction > 90) || (flashlight_direction < 270){
		image_xscale = -1;
	}
}

scr_player_collision();

// Hspd and Vspd
if (move_xTo == -1) && (move_yTo == -1){
	x += hspd;
	y += vspd;
}else{
	mp_potential_step_object(move_xTo, move_yTo, len, obj_p_solid);
}
