///@param enemyproj
///@param x
///@param y
///@param direction
///@param damage
///@param strength
///@param length
///@param object
var enemyproj = argument[0];
var xx = argument[1];
var yy = argument[2];
var dir = argument[3];
var damage = argument[4];
var strength = argument[5];
var len = argument[6] + 16;
var obj = argument[7];

var width;

switch(obj){
	case obj_proj_1:
		width = 7;
		break;
	
	case obj_proj_2:
		width = 5;
		break;
	
	case obj_proj_3:
		width = 4;
		break;
}

scr_env_objects();
var slength = array_length_1d(envobject);

var enemyline = ds_list_create();
var playerline = ds_list_create();
var envline = ds_list_create();

var enemylinelength = collision_line_width_list(xx, yy, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), width, enemyline, obj_p_enemy, false);
var playerlinelength = collision_line_width_list(xx, yy, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), width, playerline, obj_p_player, false);
var envlinelength = collision_line_width_list(xx, yy, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), width, envline, obj_p_solid, false);

var ctype = "default";
var enemydist = collision_distance_object(xx, yy, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), obj_p_enemy, width);
var playerdist = collision_distance_object(xx, yy, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), obj_p_player, width);
var envdist = collision_distance_object(xx, yy, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), obj_p_solid, width);

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

switch(ctype){
	case "enemy":
		var num = enemylinelength;
		
		if (num > 0){
			for(var i = 0; i < num; i++){
				var inst = enemyline[| i];
				
				if (inst.i_time <= 0){
					len = collision_distance_object(xx, yy, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), obj_p_enemy);
					xEnd = xx + lengthdir_x(len, dir);
					yEnd = yy + lengthdir_y(len, dir);
				
					scr_effect_screenshake(2);
					scr_effect_freeze(15);
				
					if (inst.object_index == obj_enemy_1){
						if (inst.owner != global.player) && (inst.owner != noone){
							continue;
						}
					}
					
					with(inst){
						scr_pawn_damage(clamp(damage - defense, 1, 6), strength, dir, 4);
					}
					
					part_particles_create(global.ps_front, inst.x, inst.y + 6, global.pt_burst_2, 6);
					if (inst.object_index != obj_enemy_1) && (inst.object_index != obj_enemy_3) && (inst.object_index != obj_giantturret){
						repeat(5){
							var gore = instance_create(inst.x, inst.y, obj_ef_gore);
							gore.dir = dir + random_range(-20, 20);
						}
						
						repeat(13){
							var spurt = instance_create(inst.x + random_range(-5, 5), inst.y + random_range(-8, 8), obj_ef_bloodspurt);
							spurt.dir = dir + random_range(-38, 38);
						}
					
					    part_particles_create(global.ps_front, inst.x, inst.y, global.pt_blood_0, 3);
					    part_particles_create(global.ps_bottom, inst.x, inst.y + 6, global.pt_blood_1, 10);
						part_particles_create(global.ps_bottom, inst.x, inst.y + 6, global.pt_blood_3, 3);
					    part_particles_create(global.ps_bottom, inst.x, inst.y + 6, global.pt_gore_0, 3);
						part_type_direction(global.pt_blood_5, dir - 20, dir + 20, 0, 0);
						part_type_speed(global.pt_blood_5, 2.75, 3.75, -0.15, 0);
						repeat(9)part_particles_create(global.ps_bottom, xEnd + random_range(-8, 8), yEnd + random_range(-8, 8), global.pt_blood_5, 1);
					    scr_effect_object(xEnd, yEnd, obj_ef_blood, spr_ef_blood_0, 0, 1);
					    scr_effect_object(xEnd + random_range(-6, 6), yEnd + random_range(-6, 6), obj_ef_blood, spr_ef_blood_1, 0, 1);
					}
					
					if (inst.object_index == obj_enemy_3) && (inst.object_index == obj_giantturret){
						scr_sound_play(snd_object_metal_hit_0, false, 0.8, 1.2);
						scr_effect_object(inst.x, inst.y, obj_ef_blood, spr_ef_metal_0, 0, 1);
					}else{
						scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
					}
				}
			}
		}
		
		break;
	
	case "player":
		num = playerlinelength;
		
		if (num > 0){
			for(var i = 0; i < num; i++){
				var inst = playerline[| i];
				
				if (inst.i_time < 1){
					len = collision_distance_object(xx, yy, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), obj_p_player);
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
						if (inst.object_index == global.player){
							scr_player_damage(damage, strength, dir, 6);
						}else{
							scr_pawn_damage(damage, strength, dir, 6);
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
				}
			}
		}
		
		break;
	
	case "env":
		var num = envlinelength;
		if (num > 0){
			for(var i = 0; i < num; i++){
				var inst = envline[| i], xEnd, yEnd, isEnv;
				len = collision_distance_object(xx, yy, xx + lengthdir_x(len, dir), yy + lengthdir_y(len, dir), inst) + 10;
				xEnd = xx + lengthdir_x(len, dir);
				yEnd = yy + lengthdir_y(len, dir);
				isEnv = false;
				
				for(var s = 0; s < slength; s++){
					if (inst.object_index == envobject[s]){
						if (inst.hit_time <= 0){
							isEnv = true;
							inst.flash = 0.8;
							scr_sound_play_distance_pitch(snd_object_box_hit_0, false, 220, 0.8, 1.2);
					
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
							}
						
							inst.hit_time = 6;
							inst.spd = 0.8;
							inst.dir = dir;
							
							part_type_direction(global.pt_wood_1, (dir - 180) - 50, (dir - 180) + 50, 0, 0);
							repeat(10)part_particles_create(global.ps_bottom, xEnd + random_range(-8, 8), yEnd + random_range(-8, 8), global.pt_wood_1, 2);
						}

						break;
					}
				}
				
				if (!isEnv){
					break;
				}
			}
		
			break;
		}
}

ds_list_destroy(enemyline);
ds_list_destroy(playerline);
ds_list_destroy(envline);
return len;