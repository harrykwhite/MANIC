var speed_multiplier = 1;
var speed_final;

if (instance_exists(obj_player)){
	if (move_time > 0){
		move_time --;
	}else{
		var dir = random(360);
		var len = random_range(40, 60);
		var xx = xstart + lengthdir_x(len, dir);
		var yy = ystart + lengthdir_y(len, dir);
		var counter = 0;
		
		while(collision_line(x, y, xx, yy, obj_p_solid, false, true)){
			dir = random(360);
			len = random_range(40, 60);
			xx = xstart + lengthdir_x(len, dir);
			yy = ystart + lengthdir_y(len, dir);
			
			if (counter < 100){
				counter ++;
			}else{
				counter = 0;
				break;
			}
		}
		
		move_x_to = xx;
		move_y_to = yy;
		
		move_time = 60 * random_range(3, 5);
	}
	
	if (distance_to_point(move_x_to, move_y_to) > 15){
		move_speed = 1.2;
	}else{
		move_speed = 0;
	}
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

mp_potential_step_object(move_x_to, move_y_to, move_speed_real, obj_p_solid);

// Facing
if (point_distance(x, y, move_x_to, move_y_to) > 8){
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
				sprite_index = spr_player_child_0_idle_0;
				break;
		
			case 1:
				sprite_index = spr_player_child_1_idle_0;
				break;
		}
	}else{
		sprite_index = spr_player_wife_walk_0;
	}
}