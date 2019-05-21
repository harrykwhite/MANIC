var speed_multiplier = 1;
var speed_final = 0;
bleed = true;
target = obj_player;

switch(type){
	case Enemy0_Type.Grenadier:
		speed_multiplier -= 0.15;
		break;
		
	case Enemy0_Type.Sniper:
		speed_multiplier -= 0.2;
		break;
	
	case Enemy0_Type.Mother:
		speed_multiplier -= 0.075;
		break;
		
	case Enemy0_Type.Fly:
		speed_multiplier -= 0.5;
		break;
}

if (instance_exists(target)){
	if (instance_exists(weapon)){
		weapon.dir = point_direction(x, y, move_x_to, move_y_to);
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
}else{
	if (image_xscale == scale){
		weapon.dir = 360;
	}else{
		weapon.dir = 180;
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

mp_potential_step_object(move_x_to, move_y_to, move_speed_real, obj_p_solid);

// Facing
if (move_x_to > x){
	image_xscale = scale;
}else{
	image_xscale = -scale;
}

// Animation
if (instance_exists(weapon)){
	
	var Idle0 = spr_enemy_0_headless_idle_0, Walk0 = spr_enemy_0_headless_walk_0;
	var Idle1 = spr_enemy_0_headless_idle_1, Walk1 = spr_enemy_0_headless_walk_1;
	var Idle2 = spr_enemy_0_headless_idle_2, Walk2 = spr_enemy_0_headless_walk_2;
	
	switch(type){
		case Enemy0_Type.Fly:
			Idle0 = spr_enemy_0_headless_fly_idle_0; Walk0 = spr_enemy_0_headless_fly_walk_0;
			Idle1 = spr_enemy_0_headless_fly_idle_1; Walk1 = spr_enemy_0_headless_fly_walk_1;
			Idle2 = spr_enemy_0_headless_fly_idle_2; Walk2 = spr_enemy_0_headless_fly_walk_2;
			break;
	}
	
	if (speed_final <= 0.1){
		scr_pawn_sprite_weapon(global.pawnweapon_playerindex[weapon_index], Idle1, Idle0, Idle2);
	}else{
		scr_pawn_sprite_weapon(global.pawnweapon_playerindex[weapon_index], Walk1, Walk0, Walk2);
	}
}

if (speed_final <= 0.1) || (!instance_exists(target)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else{
	image_speed = (speed_final * 0.165);
}