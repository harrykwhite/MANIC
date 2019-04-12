var speed_multiplier = 1;
var face_player = false;
var speed_final;
var distTo = 0;

if (instance_exists(obj_player)){
	if (!in_cutscene){
		if (!instance_exists(target) || (target == noone)){
			if (global.cutscene_current == -1){
				var enemyCount = array_length_1d(global.enemy);
				for(var i = 0; i < enemyCount; i ++){
					if (instance_exists(global.enemy[i])){
						target = instance_nearest(x, y, global.enemy[i]);
				
						if (collision_line(x, y, target.x, target.y, obj_p_solid, false, true)){
							target = noone;
						}
				
						if (distance_to_object(target) > 70 + (30 * order)){
							target = noone;
						}
					}
				}
			}
		
			if (distance_to_object(obj_player) > 70 + (30 * order)) || (global.cutscene_current == 52){
				move_xTo = obj_player.x;
				move_yTo = obj_player.y;
				move_speed = 1.8;
				
				if (distance_to_object(obj_player) > 100 + (30 * order)){
					move_speed = 2.1;
				}
			
				face_player = true;
			}else if (global.cutscene_current != 2){
				if (distance_to_point(move_xTo, move_yTo) > 40){
					move_speed = 1.3;
					move_time = 35;
				}else{
					move_speed = 0;
					if (move_time > 0){
						move_time--;
					}else{
						var attempts = 0;
						var dirto = point_direction(obj_player.x, obj_player.y, x, y);
						var xx = obj_player.x + lengthdir_x(40 * order, dirto);
						var yy = obj_player.y + lengthdir_y(40 * order, dirto);
						
						var dir = random(360);
						move_xTo = xx + lengthdir_x(35, dir);
						move_yTo = yy + lengthdir_y(35, dir);
						
						while(distance_to_point(move_xTo, move_yTo) < 30) || (collision_line(x, y, move_xTo, move_yTo, obj_p_solid, false, true)){
							dir = random(360);
							move_xTo = xx + lengthdir_x(35, dir);
							move_yTo = yy + lengthdir_y(35, dir);
							
							if (attempts < 200){
								attempts ++;
							}else{
								break;
							}
						}
						
						move_time = random_range(30, 60) * 0.6;
					}
				}
			}
		}else{
			if (bite_to){
				move_xTo = target.x;
				move_yTo = target.y + 6;
				move_speed = 1.85;
		
				if (distance_to_point(move_xTo, move_yTo) < 3){
					bite_to = false;
					bite_retreat = true;
					bite_retreat_direction = point_direction(x, y, move_xTo, move_yTo) - 180;
					bite_retreat_x = target.x;
					bite_retreat_y = target.y + 6;
				}
			}else if (bite_retreat){
				move_xTo = bite_retreat_x + lengthdir_x(80, bite_retreat_direction);
				move_yTo = bite_retreat_y + lengthdir_y(80, bite_retreat_direction);
				move_speed = 1.7;
		
				if (distance_to_point(move_xTo, move_yTo) < 24) || (distance_to_point(bite_retreat_x, bite_retreat_y) > 80){
					bite_to = false;
					bite_retreat = false;
				}
			}else{
				move_xTo = target.x;
				move_yTo = target.y;
			
				if (distance_to_object(target) > 58){
					move_speed = 1.2;
				}else{
					if (bite_time > 0){
						bite_time --;
					}else{
						bite_time = (60 * 0.3) + random_range(-20, 5);
						bite_to = true;
						bite_retreat = false;
					}
				
					move_speed = 0;
				}
			}
		}
	}else{
		if (distance_to_object(obj_player) > 37 + (30 * order)){
			move_speed = 1;
		}else{
			move_speed = 0;
		}
		
		move_xTo = obj_player.x;
		move_yTo = obj_player.y;
	}
	
	if (bark_time > 0){
		bark_time--;
	}else{
		scr_sound_play_distance(snd_character_bark_0, false, 300);
		bark_time = random_range(400, 650);
	}
	
	distTo = distance_to_point(move_xTo, move_yTo);
}else{
	move_speed = 0;
}

// Off - screen movement.
if (global.cutscene_current != 2){
	x = clamp(x, 22, room_width - 22);
	y = clamp(y, 22, room_height - 22);

	if (!onscreen(x, y)){
		speed_multiplier = 0;
	}
}

// Moving
speed_final = move_speed * speed_multiplier * move_speed_offset;

if (move_speed_real < speed_final){
    move_speed_real += 0.2;
}else if (move_speed_real > speed_final){
    move_speed_real -= 0.2;
}

mp_potential_step_object(move_xTo, move_yTo, move_speed_real, obj_p_solid);

// Facing
if (!face_player){
	if (distTo > 15){
		if (move_xTo > x){
			image_xscale = scale;
		}else{
			image_xscale = -scale;
		}
	}
}else{
	if (obj_player.x > x){
		image_xscale = scale;
	}else{
		image_xscale = -scale;
	}
}

// Animation
if (speed_final > 0.1){
	sprite_index = spr_companion_3_walk_0;
}else{
	sprite_index = spr_companion_3_idle_0;
}

if (speed_final < 0.1) || (!instance_exists(obj_player)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else if (speed_final >= 0.1) && (speed_final <= 0.75){
    image_speed = 0.15;
}else if (speed_final < 1.1) && (speed_final > 0.75){
    image_speed = 0.25;
}else if (speed_final >= 1.1){
    image_speed = 0.35;
}