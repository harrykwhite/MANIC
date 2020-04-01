///@param enemyproj
///@param x
///@param y
///@param direction
///@param damage
///@param strength
///@param length
///@param object
///@param sourcex
///@param sourcey
var enemyproj = argument0;
var xx = argument1;
var yy = argument2;
var dir = argument3;
var damage = argument4;
var strength = argument5;
var len = argument6 + 16;
var obj = argument7;
var sourcex = argument8;
var sourcey = argument9;

if (global.cutscene_current != -1) || (global.game_pause){
	return;
}

var width;

switch(obj){
	case obj_proj_1:
		width = 10;
		break;
	
	case obj_proj_2:
		width = 7;
		break;
	
	case obj_proj_3:
		width = 6;
		break;
}

var enemyline = ds_list_create();
var playerline = ds_list_create();
var envline = ds_list_create();

var enemylinelength = collision_line_width_list(sourcex, sourcey, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), width, enemyline, obj_p_enemy_hitbox);
var playerlinelength = collision_line_width_list(sourcex, sourcey, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), width, playerline, obj_p_player_hitbox);
var envlinelength = collision_line_width_list(sourcex, sourcey, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), width, envline, obj_p_environhit);

var ctype = "default";
var enemydist = collision_distance_object(sourcex, sourcey, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), obj_p_enemy_hitbox, width);
var playerdist = collision_distance_object(sourcex, sourcey, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), obj_p_player_hitbox, width);
var envdist = collision_distance_object(sourcex, sourcey, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), obj_p_environhit, width);

if (envdist < len){
	len = envdist;
	ctype = "env";
}

if (!enemyproj){
	if (enemydist < len){
		len = enemydist;
		ctype = "enemy";
	}
}else{
	if (playerdist < len){
		len = playerdist;
		ctype = "player";
	}
}

var stick_kill = false;

switch(ctype){
	case "enemy":
		var num = enemylinelength;
		var mult = scr_get_blood_mult();
		
		if (object_index == obj_weapon_40){
			mult *= 2;
		}
		
		if (num > 0){
			for(var i = 0; i < num; i ++){
				var inst = enemyline[| i].owner;
				var glove = false;
				
				if (inst.i_time <= 0){
					len = collision_distance_object(sourcex, sourcey, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), obj_p_enemy);
					xEnd = xx + lengthdir_x(len, dir);
					yEnd = yy + lengthdir_y(len, dir);
					
					if (inst.object_index == obj_enemy_1){
						if (inst.owner != obj_player) && (inst.owner != noone){
							continue;
						}
					}
					
					scr_effect_screenshake(2);
					
					if (string_char_at(object_get_name(object_index), 5) != "p"){
						scr_mouse_cross();
						glove = true;
					}else{
						mult = 1;
					}
					
					with(inst){
						scr_pawn_damage(max(damage - defense, 1), strength, dir, 4, glove);
						
						if (object_index == obj_enemy_2){
							if (bite_to){
								bite_to = false;
								bite_retreat = true;
								bite_retreat_direction = point_direction(x, y, xx, yy) - 180;
								bite_retreat_x = xx;
								bite_retreat_y = yy;
							}
						}
					}
					
					if (inst.object_index != obj_enemy_1) && (inst.object_index != obj_enemy_3) && (inst.object_index != obj_giantturret) && (inst.object_index != obj_giantturret_flamethrower){
						var yoffset = 0;
						
						if (inst.object_index == obj_enemy_0){
							yoffset = 6;
						}
						
						repeat(5 * mult){
							var gore = instance_create(inst.x, inst.y, obj_ef_gore);
							gore.dir = dir + random_range(-20, 20);
						}
						
						repeat(13 * mult){
							var spurt = instance_create(inst.x + random_range(-5, 5), inst.y + random_range(-8, 8), obj_ef_bloodspurt);
							spurt.dir = dir + random_range(-38, 38);
						}
						
					    part_particles_create(global.ps_front, inst.x, inst.y, global.pt_blood_0, 3 * mult);
					    part_particles_create(global.ps_bottom, inst.x, inst.y + yoffset, global.pt_blood_1, 10 * mult);
						part_particles_create(global.ps_bottom, inst.x, inst.y + yoffset, global.pt_blood_3, 3 * mult);
					    part_particles_create(global.ps_bottom, inst.x, inst.y + yoffset, global.pt_gore_0, 3 * mult);
						part_type_direction(global.pt_blood_5, dir - 20, dir + 20, 0, 0);
						part_type_speed(global.pt_blood_5, 2.75, 3.75, -0.15, 0);
						repeat(9 * mult)part_particles_create(global.ps_bottom, xEnd + random_range(-8, 8), yEnd + random_range(-8, 8), global.pt_blood_5, mult);
					    scr_effect_object(xEnd, yEnd, obj_ef_blood, spr_ef_blood_0, 0, 1);
					    scr_effect_object(xEnd + random_range(-6, 6), yEnd + random_range(-6, 6), obj_ef_blood, spr_ef_blood_1, 0, 1);
					}
					
					if (inst.object_index == obj_enemy_3) || (inst.object_index == obj_giantturret) || (inst.object_index == obj_giantturret_flamethrower){
						scr_sound_play(snd_object_metal_hit_0, false, 0.8, 1.2);
						scr_effect_object(xEnd, yEnd, obj_ef_blood, spr_ef_metal_0, 0, 1);
					}else{
						scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
					}
					
					stick_kill = true;
				}
			}
		}
		
		break;
	
	case "player":
		num = playerlinelength;
		
		if (num > 0){
			for(var i = 0; i < num; i ++){
				var inst = playerline[| i].owner;
				var final_damage = damage;
				
				if (inst.object_index == obj_player) && (object_index == global.pawnweapon_object[PawnWeapon.Greatsword]){
					if (scr_player_has_upgrade(PlayerUpgrade.Chestplate)){
						final_damage = round(final_damage * 0.25);
					}else{
						if (room == rm_level_6_pre_00){
							var antag = instance_nearest(obj_player.x, obj_player.y, obj_antagonist);
							
							if (antag != noone){
								if (!antag.greatsword_attack_killed){
									antag.greatsword_attack_killed = true;
									
									obj_player.near_dead = true;
									
									global.game_boss_firstantag_killed = true;
									global.cutscene_current = 58;
									global.boss_current = -1;
									
									audio_sound_gain(global.boss_music[Boss.Antagonist], 0, 5000);
									audio_play_sound(global.boss_stinger[Boss.Antagonist], 3, false);
								}
							}
						}
					}
				}
				
				if (inst.i_time <= 0){
					len = collision_distance_object(sourcex, sourcey, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), obj_p_player);
					xEnd = xx + lengthdir_x(len, dir);
					yEnd = yy + lengthdir_y(len, dir);
				
					scr_effect_screenshake(2);
					part_particles_create(global.ps_front, inst.x, inst.y, global.pt_blood_0, 3);
					part_particles_create(global.ps_bottom, inst.x, inst.y + 6, global.pt_blood_1, 6);
					part_particles_create(global.ps_bottom, inst.x, inst.y + 6, global.pt_blood_3, 3);
					part_particles_create(global.ps_bottom, inst.x, inst.y + 6, global.pt_gore_0, 3);
					scr_effect_object(xEnd, yEnd, obj_ef_blood, spr_ef_blood_0, 0, 1);
					scr_effect_object(xEnd + random_range(-6, 6), yEnd + random_range(-6, 6), obj_ef_blood, spr_ef_blood_1, 0, 1);
					scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
					
					with(inst){
						if (inst.object_index == obj_player){
							scr_player_damage(final_damage, strength, dir, 6);
						}else{
							scr_pawn_damage(final_damage, strength, dir, 6);
						}
						
						repeat(5){
							var gore = instance_create(inst.x, inst.y, obj_ef_gore);
							gore.dir = dir + random_range(-20, 20);
						}
						
						repeat(13){
							var spurt = instance_create(inst.x + random_range(-5, 5), inst.y + random_range(-8, 8), obj_ef_bloodspurt);
							spurt.dir = dir + random_range(-38, 38);
						}
						
						part_type_direction(global.pt_blood_5, 0, 360, 0, 0);
						part_type_speed(global.pt_blood_5, 3, 5, -0.2, 0);
						repeat(3)part_particles_create(global.ps_bottom, xEnd + random_range(-8, 8), yEnd + random_range(-8, 8), global.pt_blood_5, 1);
					}
					
					stick_kill = true;
				}
			}
		}
		
		break;
	
	case "env":
		var num = envlinelength;
		if (num > 0){
			for(var i = 0; i < num; i ++){
				var inst = envline[| i], xEnd, yEnd;
				len = collision_distance_object(sourcex, sourcey, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), inst, 3);
				xEnd = xx + lengthdir_x(len, dir);
				yEnd = yy + lengthdir_y(len, dir);
				
				if (inst.object_index == obj_p_depth_door) || (object_get_parent(inst.object_index) == obj_p_depth_door){
					if (!inst.breakable){
						return;
					}
				}
				
				if (inst.hit_time <= 0){
					inst.flash = 0.8;
				
					switch(obj){
						case obj_proj_1:
							inst.hit -= 5;
							break;
					
						case obj_proj_2:
							inst.hit -= 4;
							break;
					
						case obj_proj_3:
							inst.hit -= 3;
							break;
					
						default:
							show_debug_message("Proj environmental damage has not been applied");
							break;
					}
					
					inst.hit_time = 6;
					inst.spd = 0.8;
					inst.dir = dir;
					
					if (inst.object_index == obj_prisonbar_3){
						scr_sound_play_distance_pitch(snd_object_metal_hit_0, false, 220, 0.8, 1.2);
						scr_effect_object(xEnd + random_range(-13, 13), yEnd + random_range(-6, 6), obj_ef_blood, spr_ef_metal_0, 0, 1);
					}else{
						scr_sound_play_distance_pitch(snd_object_box_hit_0, false, 220, 0.8, 1.2);
						part_type_direction(global.pt_wood_1, (dir - 180) - 30, (dir - 180) + 30, 0, 0);
						repeat(7) part_particles_create(global.ps_bottom, xEnd + random_range(-8, 8), yEnd + random_range(-8, 8), global.pt_wood_1, 2);
					}
					
					stick_kill = true;
				}
			}
		}
		
		break;
}

if (object_index == obj_weapon_1 || object_index == obj_pawnweapon_0) && (stick_kill){
	kill = true;
}

ds_list_destroy(enemyline);
ds_list_destroy(playerline);
ds_list_destroy(envline);
return len;