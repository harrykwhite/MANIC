var speed_multiplier = 1;
var speed_final = 0;
bleed = true;

if (instance_exists(obj_player)){
	if (object_index != obj_companion_3){
		if (instance_exists(weapon) && weapon != -1){
			weapon.dir = point_direction(x, y, move_x_to, move_y_to);
		}
	}
	
	if (distance_to_point(move_x_to, move_y_to) > 10){
		move_speed = 1.65;
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

// Offscreen movement
x = clamp(x, 22, room_width - 22);
y = clamp(y, 22, room_height - 22);

if (!onscreen(x, y + 12)){
	speed_multiplier = 0;
}

// Moving
speed_final = move_speed * speed_multiplier * move_speed_offset;

if (move_speed_real < speed_final){
    move_speed_real += 0.2;
}else if (move_speed_real > speed_final){
    move_speed_real -= 0.2;
}

scr_pawn_find_path();

// Facing
if (move_x_to > x){
	image_xscale = scale;
}else{
	image_xscale = -scale;
}

// Animation
if (object_index != obj_companion_3){
	if (instance_exists(weapon) && weapon != -1){
		var Idle0, Walk0;
		var Idle1, Walk1;
		var Idle2, Walk2;
	
		switch(object_index){
			case obj_companion_0:
				Idle0 = spr_companion_0_headless_idle_0; Walk0 = spr_companion_0_headless_walk_0;
				Idle1 = spr_companion_0_headless_idle_1; Walk1 = spr_companion_0_headless_walk_1;
				Idle2 = spr_companion_0_headless_idle_2; Walk2 = spr_companion_0_headless_walk_2;
				break;
		
			case obj_companion_1:
				Idle0 = spr_companion_1_headless_idle_0; Walk0 = spr_companion_1_headless_walk_0;
				Idle1 = spr_companion_1_headless_idle_1; Walk1 = spr_companion_1_headless_walk_1;
				Idle2 = spr_companion_1_headless_idle_2; Walk2 = spr_companion_1_headless_walk_2;
				break;
		
			case obj_companion_2:
				Idle0 = spr_companion_2_headless_idle_0; Walk0 = spr_companion_2_headless_walk_0;
				Idle1 = spr_companion_2_headless_idle_1; Walk1 = spr_companion_2_headless_walk_1;
				Idle2 = spr_companion_2_headless_idle_2; Walk2 = spr_companion_2_headless_walk_2;
				break;
		}
	
		if (speed_final <= 0.1){
			scr_pawn_sprite_weapon(global.pawnweapon_playerindex[weapon_index], Idle1, Idle0, Idle2);
		}else{
			scr_pawn_sprite_weapon(global.pawnweapon_playerindex[weapon_index], Walk1, Walk0, Walk2);
		}
	}
}else{
	if (speed_final > 0.1){
		sprite_index = spr_companion_3_walk_0;
	}else{
		sprite_index = spr_companion_3_idle_0;
	}
}

if (speed_final <= 0.1) || (!instance_exists(obj_player)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else if (speed_final >= 0.1) && (speed_final <= 0.75){
    image_speed = 0.15;
}else if (speed_final < 1.1) && (speed_final > 0.75){
    image_speed = 0.25;
}else if (speed_final >= 1.1){
    image_speed = 0.35;
}