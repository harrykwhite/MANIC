var speed_multiplier = 1;
var face_player = true;
var speed_final;
var dist_to = 0;

if (instance_exists(obj_player)){
	if (global.cutscene_current != -1){
		if (obj_player.move_x_to != -1) || (obj_player.move_y_to != -1){
			speed_multiplier *= obj_player.move_ext_spd / obj_player.spd_max;
		}
	}
	
	if (!in_cutscene){
		if (!instance_exists(target) || (target == noone)){
			if (global.cutscene_current == -1) && (distance_to_object(obj_player) < 150){
				var enemyCount = array_length_1d(global.enemy);
				
				for(var i = 0; i < enemyCount; i ++){
					if (i == 1){
						continue;
					}
					
					if (instance_exists(global.enemy[i])){
						target = instance_nearest(x, y, global.enemy[i]);
					
						if (target.object_index == obj_antagonist){
							if (target.walk_off){
								target = noone;
								continue;
							}
						}
						
						if (target.object_index == obj_thedogkeeper){
							if (!target.dogs_downed){
								var dog = instance_nearest(x, y, obj_thedogkeeper_dog);
							
								if (dog != noone){
									target = dog;
									continue;
								}
							}
						}
						
						if (target.cutscene_prop) || (collision_line(x, y, target.x, target.y, obj_p_solid, false, true)) || (distance_to_object(target) > 300){
							target = noone;
							continue;
						}
					}
				}
			}
		
			var dist_to_player = distance_to_object(obj_player);
			
			if (dist_to_player > 70 + (companionspacing * order)) || (global.cutscene_current == 52){
				move_x_to = obj_player.x;
				move_y_to = obj_player.y + 6;
				move_speed = 1.8;
				
				if (dist_to_player > 100 + (companionspacing * order)){
					move_speed = 2.3;
				}
				
				if (dist_to_player > 140 + (companionspacing * order)){
					move_speed = 2.7;
				}
				
				if (dist_to_player > 180 + (companionspacing * order)){
					move_speed = 3.1;
				}
			}else{
				move_speed = 0;
				move_x_to = obj_player.x;
				move_y_to = obj_player.y + 6;
			}
		}else if (global.cutscene_current == -1){
			if (distance_to_object(obj_player) > 200){
				target = noone;
				bite_to = false;
				bite_retreat = false;
			}else{
				if (bite_to){
					move_x_to = target.x;
					move_y_to = target.y + 6;
				
					move_speed = 2;
					bite_to_time ++;
					bite_retreat_time = 0;
				
					if (distance_to_point(move_x_to, move_y_to) < 7) || (bite_to_time > 120){
						bite_to = false;
						bite_to_time = 0;
						bite_retreat = true;
						bite_retreat_x = target.x;
						bite_retreat_y = target.y + 6;
					}
				}else if (bite_retreat){
					var rdir = point_direction(target.x, target.y + 6, x, y);
					move_x_to = x + lengthdir_x(45, rdir);
					move_y_to = y + lengthdir_y(45, rdir);
				
					move_speed = 1.6;
					bite_retreat_time ++;
					bite_to_time = 0;
				
					face_player = false;
				
					if (bite_retreat_time > 60){
						bite_to = false;
						bite_retreat = false;
					}
				}else{
					move_x_to = target.x;
					move_y_to = target.y + 6;
				
					if (distance_to_object(target) > 60){
						if (move_away_time > 0){
							move_away_time --;
							move_speed = 0;
						}else{
							move_speed = 1.2;
						}
					}else{
						move_away_time = 20;
					
						if (bite_time > 0){
							bite_time --;
						}else{
							bite_time = bite_time_max + random_range(-20, 5);
							bite_to = true;
							bite_retreat = false;
						}
				
						move_speed = 0;
					}
				}
			}
		}
	}else{
		if (distance_to_object(obj_player) > 37 + (companionspacing * order)){
			move_speed = 1.7;
		}else{
			move_speed = 0;
		}
		
		move_x_to = obj_player.x;
		move_y_to = obj_player.y + 6;
	}
	
	if (bark_time > 0){
		bark_time--;
	}else{
		scr_sound_play(snd_character_bark_0, false, 0.8, 1.2);
		bark_time = random_range(400, 650);
	}
	
	dist_to = distance_to_point(move_x_to, move_y_to);
	
	if (!cutscene_prop){
		if (global.cutscene_current == 2) || (global.cutscene_current == 52) || (global.cutscene_current == 58){
			if (distance_to_object(obj_player) > 67 + (companionspacing * order)){
				move_x_to = obj_player.x;
				move_y_to = obj_player.y + 6;
				move_speed = 1.9;
			}
		}
	}
	
	scr_companion_teleport();
	scr_companion_healing();
}else{
	face_player = false;
	move_speed = 0;
}

// Moving
speed_final = move_speed * speed_multiplier * move_speed_offset;

if (move_speed_real < speed_final){
    move_speed_real += min(0.1, speed_final - move_speed_real);
}else if (move_speed_real > speed_final){
    move_speed_real -= min(0.2, move_speed_real - speed_final);
}

if (!scr_pawn_find_path()){
	move_speed_real = 0;
	speed_final = 0;
}

// Facing
if (face_player && !instance_exists(target)){
	face_player = false;
}

if (!face_player){
	if (dist_to > 15){
		if (move_x_to > x){
			image_xscale = scale;
		}else{
			image_xscale = -scale;
		}
	}
}else{
	if (target.x > x){
		image_xscale = scale;
	}else{
		image_xscale = -scale;
	}
}

// Animation
if (speed_final > 0.4){
	sprite_index = spr_companion_3_walk_0;
}else{
	sprite_index = spr_companion_3_idle_0;
}

if (speed_final <= 0.4) || (!instance_exists(obj_player)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else if (speed_final >= 0.4) && (speed_final <= 0.75){
    image_speed = 0.15;
}else if (speed_final < 1.1) && (speed_final > 0.75){
    image_speed = 0.25;
}else if (speed_final >= 1.1){
    image_speed = 0.35;
}