var speed_multiplier = 1;
var speed_final = 0;
var face_player = false;
target = obj_player;

if (instance_exists(target)){
	scr_enemy_find_companion();
	
	var dist_to = point_distance(x, y, target.x, target.y);
	
	move_x_to = target.x;
	move_y_to = target.y + 6;
	
	if (dist_to > 10){
		move_speed = 0.2;
	}else{
		move_speed = 0;
	}
}else{
	move_speed = 0;
	face_player = false;
}

// Cutscene
if (cutscene_prop){
	if (!in_cutscene){
		speed_multiplier = 0;
	}
}

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
if (!face_player){
	if (move_x_to > x){
		image_xscale = scale * scale_mult_x;
	}else{
		image_xscale = -scale * scale_mult_x;
	}
}else{
	if (target.x > x){
		image_xscale = scale * scale_mult_x;
	}else{
		image_xscale = -scale * scale_mult_x;
	}
}

// Animation
image_speed = 0.1;
sprite_index = spr_enemy_4_idle_0;