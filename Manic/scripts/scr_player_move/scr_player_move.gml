// Variables
var spd_multiplier = spd_offset;
var weapon_index = global.weapon_slot[global.weapon_slotcurrent];
var has_weapon = (weapon_index != -1) || (global.level_current != Level.Prologue);
var footstep_wood, footstep_road, footstep_tile;
footstep_sound = global.player_footstep_default;

if (spd_offset > 1){
	spd_offset -= spd_offset_change;
}else if (spd_offset < 1){
	spd_offset += spd_offset_change;
}

// Minecart State
if (in_minecart){
	state = scr_player_minecart;
	return;
}

// Main
if (global.weapon_slot_standalone == -1){
	
	// Axis
	var key_right = keyboard_check_direct(obj_controller_all.key_right);
	var key_left = keyboard_check_direct(obj_controller_all.key_left);
	var key_up = keyboard_check_direct(obj_controller_all.key_up);
	var key_down = keyboard_check_direct(obj_controller_all.key_down);
	var key_dash = keyboard_check_pressed(obj_controller_all.key_dash);
	
	xaxis = key_right - key_left;
	yaxis = key_down - key_up;
	
	if (!window_has_focus()){
		xaxis = 0;
		yaxis = 0;
	}
	
	if (!key_right) && (!key_left){
		xaxis = 0;
	}
	
	if (!key_down) && (!key_up){
		yaxis = 0;
	}
	
	dir = point_direction(0, 0, xaxis, yaxis);
	image_angle = 0;
	
	// Offset
	var spread = 0;
	
	if (global.game_save_level >= Level.HumanPrison){
		spread += global.level_current;
	}
	
	if (global.game_save_level >= Level.DesolateVillage){
		spread += 4;
	}
	
	if (spread > 0){
		if (offset > offset_to){
			offset -= 0.1;
		}else if (offset < offset_to){
			offset += 0.1;
		}
		
		if (offset_time > 0){
			offset_time --;
		}else{
			offset_to = (irandom(spread * 10) / 10) * choose(-1, 1);
			offset_time = offset_time_max + random_range(-10, 10);
		}
		
		dir += offset;
	}
	
	// Idle Walk
	if (global.game_save_level >= Level.TrainStation){
		if (xaxis == 0 && yaxis == 0 && global.cutscene_current == -1){
			if (random(100) < 0.5){
				idlewalk = true;
				idlewalk_time = 0;
			}
		}
	}
	
	if (idlewalk){
		if (xaxis != 0 || yaxis != 0){
			idlewalk = false;
			idlewalk_walktime = random_range(5, 10);
		}
		
		if (idlewalk_time > 0){
			idlewalk_time --;
		}else{
			idlewalk_dir = random(360);
			idlewalk_time = random_range(60 * 3, 60 * 4);
			idlewalk_walktime = random_range(5, 10);
		}
		
		if (idlewalk_walktime > 0){
			xaxis = dcos(idlewalk_dir);
			yaxis = dsin(idlewalk_dir);
			dir = idlewalk_dir;
			
			idlewalk_walktime --;
		}else{
			idlewalk_walktime = 0;
		}
	}
	
	// Speed
	if (i_time > 0){
		spd_multiplier += 0.125;
	}
	
	if (upgrade_has[PlayerUpgrade.RunningBoots]){
		spd_multiplier += 0.2;
	}
	
	if (has_weapon){
		if (global.weapon_heavy[global.weapon_slot[global.weapon_slotcurrent]]){
		    spd_multiplier -= 0.1;
		}
	}

	if (global.player_health_current <= 2){
	    spd_multiplier += 0.1;
	}
	
	if (global.player_health_current <= 4){
		spd_multiplier += 0.05;
	}

	if (!global.player_stamina_active){
	    spd_multiplier -= 0.1;
	}
	
	if (burn_time > 0){
		spd_multiplier += 0.15;
	}

	// Footstep Sound
	if (global.level_current != Level.UndergroundBunker) && (global.level_current != Level.HumanPrison) && (global.level_current != Level.CityHeadquarters){
		if (layer_exists("InteriorFloorWood")){
			footstep_wood = layer_tilemap_get_id("InteriorFloorWood");
			if (tilemap_get_at_pixel(footstep_wood, x, y + 18)){
				footstep_sound = snd_character_footstep_wood;
			}
		}
		
		if (layer_exists("InteriorFloorTile")){
			footstep_tile = layer_tilemap_get_id("InteriorFloorTile");
			if (tilemap_get_at_pixel(footstep_tile, x, y + 18)){
				footstep_sound = snd_character_footstep_wood;
			}
		}
		
		if (room == rm_level_8_01) || (room == rm_level_8_02) || (room == rm_level_9_00) || (room == rm_level_9_01) || (room == rm_level_9_02){
			if (layer_exists("Road")){
				footstep_road = layer_tilemap_get_id("Road");
				if (layer_tilemap_exists(layer_get_id("Road"), footstep_road)){
					if (tilemap_get_at_pixel(footstep_road, x, y + 18)){
						footstep_sound = snd_character_footstep_wood;
					}
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
				scr_sound_play_distance_pitch(footstep_sound, false, 180, 0.8, 1.1);
			}
		}
	}else{
		footstep_time = 19;
	}

	if (len == 0) && (xaxis == 0) && (yaxis == 0){
	    if (has_weapon){
	        if (!global.weapon_heavy[weapon_index]){
	            sprite_index = spr_player_idle_0;
	        }else{
	            sprite_index = spr_player_idle_2;
	        }
	    }else{
	        sprite_index = spr_player_idle_1;
	    }
	}else{
		// Movement
	    if (has_weapon){
			if (!global.weapon_heavy[weapon_index]){
				sprite_index = spr_player_walk_0;
			}else{
				sprite_index = spr_player_walk_2;
			}
		}else{
			sprite_index = spr_player_walk_1;
	    }
	}

	// Knockback
	if (knockback) && (move_x_to == -1) && (move_y_to == -1) && (global.cutscene_current == -1){
		for(var i = knockback_speed + 3; i > -1; i--){
		    if (place_meeting(x + lengthdir_x(i, knockback_direction), y + lengthdir_y(i, knockback_direction), obj_p_solid)) || (knockback_speed <= 0.2){
				knockback_speed = 0;
		        knockback = false;
				return;
		    }
		}
		
		x += lengthdir_x(knockback_speed, knockback_direction);
		y += lengthdir_y(knockback_speed, knockback_direction);
    
	    knockback_speed *= 0.9;
	}else{
		knockback = false;
		knockback_speed = 0;
	}
	
	if (key_dash) && (dash_time <= 0) && (global.cutscene_current == -1) && (move_x_to == -1) && (move_y_to == -1){
		dash_length = 55;
		dash_speed = spd_max * 3.65;
		dash_time = 18;
		
		if (upgrade_has[PlayerUpgrade.KneePads]){
			dash_speed *= 1.35;
			
			if (dash_count < 1){
				dash_count ++;
				dash_time = 2;
				dash_time_short = 15;
				scr_sound_play(snd_character_dash_0, false, 0.9, 1);
			}else{
				dash_count = 0;
				dash_time = 24;
				scr_sound_play(snd_character_dash_0, false, 1.15, 1.25);
			}
		}else{
			scr_sound_play(snd_character_dash_0, false, 0.8, 1.2);
		}
		
		scr_effect_screenshake(2);
		scr_effect_vignette_flash(c_ltgray, 0.064, 0.004);
		
		dash_length_current = 0;
	    dash_direction = point_direction(0, 0, xaxis, yaxis);
		
		if (xaxis == 0) && (yaxis == 0){
			if (image_xscale == 1){
				dash_direction = 360;
			}else{
				dash_direction = 180;
			}
		}
		
		if (global.level_current == Level.Prologue){
			with(obj_controller_ui){
				if (tutourial) && (tutourial_stage == TutourialStage.Dash) && (tutourial_stage_timer == -1){
					tutourial_stage_timer = 60 * 2;
				}
			}
		}
		
	    state = scr_player_dash;
	    return;
	}
	
	if (dash_time_short > 0){
		dash_time_short --;
	}else{
		if (dash_count != 0){
			dash_time = 37 - 16;
			dash_count = 0;
		}
	}
	
	if (dash_time > 0){
		dash_time --;
	}
	
	// Movement
	if (move_x_to == -1) && (move_y_to == -1){
		if (global.cutscene_current == -1){
			if ((xaxis == 0) && (yaxis == 0)){
			    len = 0;
			}else{
			    if (len < (spd_max * spd_multiplier)){
			        len += (spd_build * spd_multiplier);
			    }else if (len > (spd_max * spd_multiplier)){
			        len -= 0.1;
			    }
			}
			
			img_speed = (len * 0.165) * spd_multiplier;
		}else{
			len = 0;
			sprite_index = spr_player_idle_1;
			img_speed = 0.03;
		}
	}else{
		var idlesprite = spr_player_idle_1;
		var walksprite = spr_player_walk_1;
		
		if (global.cutscene_current == 57) && (global.weapon_slot[0] == PlayerWeapon.Revolver){
			idlesprite = spr_player_idle_0;
			walksprite = spr_player_walk_0;
		}
		
		dir = point_direction(x, y, move_x_to, move_y_to);
		sprite_index = walksprite;
		
		if (distance_to_point(move_x_to, move_y_to) < 7){
		    len = 0;
			sprite_index = idlesprite;
			img_speed = 0.03;
		}else{
			var spd = move_extSpd;
			
			if (spd == -1){
				spd = spd_max;
			}
			
		    if (len < (spd * spd_multiplier)){
		        len += (spd_build * spd_multiplier);
		    }else if (len > (spd * spd_multiplier)){
		        len -= 0.05;
		    }
		}
		
		img_speed = (len * 0.165) * spd_multiplier;
	}
	
	if (len == 0) && (xaxis == 0) && (yaxis == 0){
		img_speed = 0.05;
	}else{
		if (xaxis != 0){
			if (sign(xaxis) != sign(image_xscale)){
				img_speed *= -1;
			}
		}
	}
	
	hspd = lengthdir_x(len, dir);
	vspd = lengthdir_y(len, dir);
}else{
	sprite_index = spr_player_idle_2;
	img_speed = 0.05;
	
	hspd = 0;
	vspd = 0;
}

// Sprite Flip
if (move_x_to == -1) && (move_y_to == -1) && (global.cutscene_current == -1){
	if (mouse_x > x){
		image_xscale = 1;
	}else{
		image_xscale = -1;
	}
}else{
	if (move_x_to > x){
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

if (!window_has_focus()){
	hspd = 0;
	vspd = 0;
}

scr_player_collision();

// Hspd and Vspd
if (move_x_to == -1) && (move_y_to == -1){
	x += hspd;
	y += vspd;
}else{
	mp_potential_step_object(move_x_to, move_y_to, len, obj_p_solid);
}

// Dash After Speed
if (dash_after_speed > 0.01){
	if (!place_meeting(x + lengthdir_x((dash_after_speed * spd_multiplier) + 2, dash_after_dir), y + lengthdir_y((dash_after_speed * spd_multiplier) + 2, dash_after_dir), obj_p_solid)){
		x += lengthdir_x(dash_after_speed * spd_multiplier, dash_after_dir);
		y += lengthdir_y(dash_after_speed * spd_multiplier, dash_after_dir);
		dash_after_speed *= 0.5 * spd_multiplier;
	}else{
		dash_after_speed = 0;
		dash_after_dir = 0;
	}
	
	img_speed += dash_after_speed * 0.165;
}