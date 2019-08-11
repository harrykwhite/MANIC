var speed_multiplier = 1;
var speed_final = 0;
var face_player = false;
target = obj_player;

if (instance_exists(target)){
	if (distance_to_point(target.x, target.y) > 10){
		move_x_to = target.x;
		move_y_to = target.y + 6;
		move_speed = 0.7;
	}else{
		move_speed = 0;
	}
	
	move_dir = point_direction(x, y, move_x_to, move_y_to);
}else{
	if (image_xscale == scale){
		weapon.dir = 360;
	}else{
		weapon.dir = 180;
	}
	
	move_speed = 0;
	face_player = false;
}

// Barrel
var nbarrel = instance_nearest(x, y, obj_barrel_2);

if (instance_exists(nbarrel)) && (barrel_pause_break <= 0){
	if (distance_to_object(nbarrel) < 140){
		if (barrel_pause_time > 0){
			barrel_pause_time --;
			speed_multiplier = max(speed_multiplier - 0.5, 0);
		}else{
			barrel_pause_time = random(40);
			barrel_pause_break = random_range(60, 120);
		}
	}
}else{
	if (barrel_pause_break > 0){
		barrel_pause_break--;
	}
}

// Moving
speed_final = move_speed * speed_multiplier * move_speed_offset;

if (move_speed_real < speed_final){
    move_speed_real += 0.2;
}else if (move_speed_real > speed_final){
    move_speed_real -= 0.2;
}

if (!scr_pawn_find_path()){
	move_speed_real = 0;
	speed_final = 0;
}

// Animation
if (arm.image_angle <= 90 || arm.image_angle >= 270){
	image_xscale = scale;
}else{
	image_xscale = -scale;
}

if (speed_final <= 0.1) || (!instance_exists(target)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
	sprite_index = spr_thedogkeeper_idle_0;
}else{
	sprite_index = spr_thedogkeeper_walk_0;
	image_speed = (speed_final * 0.165);
}