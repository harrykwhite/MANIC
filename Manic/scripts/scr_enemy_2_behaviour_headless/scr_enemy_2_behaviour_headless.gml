var speed_multiplier = 1;
var speed_final = 0;
bleed = true;
target = obj_player;

if (instance_exists(target)){
	if (distance_to_point(move_x_to, move_y_to) > 10){
		move_speed = 2;
	}else{
		var safe = 0;
		move_speed = 0;
		
		move_x_to = headless_x + lengthdir_x(35, random(360));
		move_y_to = headless_y + lengthdir_y(35, random(360));
		
		while(collision_line(x, y, move_x_to, move_y_to, obj_p_solid, false, true)) || (!onscreen(move_x_to, move_y_to, 24)){
			move_x_to = headless_x + lengthdir_x(35, random(360));
			move_y_to = headless_y + lengthdir_y(35, random(360));
			
			if (safe < 100){
				safe ++;
			}else{
				break;
			}
		}
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
if (move_x_to > x){
	image_xscale = scale;
}else{
	image_xscale = -scale;
}

// Animation
if (speed_final > 0.1){
	sprite_index = spr_enemy_2_headless_walk_0;
}else{
	sprite_index = spr_enemy_2_headless_idle_0;
}

if (speed_final <= 0.1) || (!instance_exists(target)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else{
	image_speed = (speed_final * 0.165);
}