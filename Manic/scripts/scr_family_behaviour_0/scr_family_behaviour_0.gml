var speed_multiplier = 1;
var speed_final;

if (instance_exists(obj_player)){
	if (move_time > 0){
		move_time --;
	}else{
		var xx, yy, dir, len;
		var counter = 0, found = true;
		
		do{
			dir = random(360);
			len = random_range(8, 12);
			xx = xstart + lengthdir_x(len, dir);
			yy = ystart + lengthdir_y(len, dir);
			
			if (counter < 200){
				counter ++;
			}else{
				found = false;
				break;
			}
		}until(!collision_line(x, y, xx, yy, obj_p_solid, false, true));
		
		if (found){
			move_x_to = xx;
			move_y_to = yy;
		}
		
		move_time = 60 * random_range(3, 5);
	}
	
	if (distance_to_point(move_x_to, move_y_to) > 5){
		move_speed = 1;
	}else{
		move_speed = 0;
	}
	
	if (talking){
		move_x_to = x;
		move_y_to = y;
		move_speed = 0;
	}
}else{
	move_speed = 0;
}

// Off - screen movement.
x = clamp(x, 6, room_width - 6);
y = clamp(y, 6, room_height - 6);

// Moving
speed_final = move_speed * speed_multiplier * move_speed_offset;

if (move_speed_real < speed_final){
    move_speed_real += min(0.2, speed_final - move_speed_real);
}else if (move_speed_real > speed_final){
    move_speed_real -= min(0.2, move_speed_real - speed_final);
}

if (!scr_pawn_find_path()){
	move_speed_real = 0;
	speed_final = 0;
}

// Facing
if (point_distance(x, y, move_x_to, move_y_to) > 7){
	if (move_x_to > x){
		image_xscale = scale;
	}else{
		image_xscale = -scale;
	}
}

// Animation
if (speed_final < 0.1){
	image_speed = 0.05;
	
	if (object_index == obj_player_child_0){
		switch(type){
			case 0:
				sprite_index = spr_player_child_0_idle_0;
				break;
		
			case 1:
				sprite_index = spr_player_child_1_idle_0;
				break;
		}
	}else{
		sprite_index = spr_player_wife_idle_0;
	}
}else{
	image_speed = 0.175;
	
	if (object_index == obj_player_child_0){
		switch(type){
			case 0:
				sprite_index = spr_player_child_0_walk_0;
				break;
		
			case 1:
				sprite_index = spr_player_child_1_walk_0;
				break;
		}
	}else{
		sprite_index = spr_player_wife_walk_0;
	}
}