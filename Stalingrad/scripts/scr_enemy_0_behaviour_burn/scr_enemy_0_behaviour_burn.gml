var speed_multiplier = 1;
var speed_final = 0;
target = obj_player;

switch(type){
	case EnemyOneType.Fast:
		speed_multiplier += 0.2;
		break;
	
	case EnemyOneType.Large:
		speed_multiplier -= 0.3;
		break;
	
	case EnemyOneType.Grenadier:
		speed_multiplier -= 0.15;
		break;
		
	case EnemyOneType.Sniper:
		speed_multiplier -= 0.2;
		break;
	
	case EnemyOneType.Mother:
		speed_multiplier -= 0.075;
		break;
	
	case EnemyOneType.Fly:
		speed_multiplier -= 0.5;
		break;
}

if (instance_exists(target)){
	if (distance_to_point(move_xTo, move_yTo) > 10){
		move_speed = 1.85;
	}else{
		var safe = 0;
		move_speed = 0;
		move_xTo = x + lengthdir_x(65, random(360));
		move_yTo = y + lengthdir_y(65, random(360));
		
		while(collision_line(x, y, move_xTo, move_yTo, obj_p_solid, false, true)) || (!onscreen(move_xTo, move_yTo, 24)){
			move_xTo = x + lengthdir_x(65, random(360));
			move_yTo = y + lengthdir_y(65, random(360));
			
			if (safe < 100){
				safe ++;
			}else{
				break;
			}
		}
		
		if (instance_exists(weapon)) weapon.dir = point_direction(x, y, move_xTo, move_yTo);
	}
}

// Off - screen movement.
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

mp_potential_step_object(move_xTo, move_yTo, move_speed_real, obj_p_solid);

// Facing
if (move_xTo > x){
	image_xscale = scale;
}else{
	image_xscale = -scale;
}

// Animation
if (instance_exists(weapon)){
	
	var Idle0, Walk0;
	var Idle1, Walk1;
	var Idle2, Walk2;
	
	switch(type){
		
		case EnemyOneType.Grenadier:
			Idle0 = spr_enemy_0_light_idle_0; Walk0 = spr_enemy_0_light_walk_0;
			Idle1 = spr_enemy_0_light_idle_1; Walk1 = spr_enemy_0_light_walk_1;
			Idle2 = spr_enemy_0_light_idle_2; Walk2 = spr_enemy_0_light_walk_2;
			break;
			
		case EnemyOneType.Sniper:
			Idle0 = spr_enemy_0_light_idle_0; Walk0 = spr_enemy_0_light_walk_0;
			Idle1 = spr_enemy_0_light_idle_1; Walk1 = spr_enemy_0_light_walk_1;
			Idle2 = spr_enemy_0_light_idle_2; Walk2 = spr_enemy_0_light_walk_2;
			break;
		
		case EnemyOneType.Fly:
			Idle0 = spr_enemy_0_fly_idle_0; Walk0 = spr_enemy_0_fly_walk_0;
			Idle1 = spr_enemy_0_fly_idle_1; Walk1 = spr_enemy_0_fly_walk_1;
			Idle2 = spr_enemy_0_fly_idle_2; Walk2 = spr_enemy_0_fly_walk_2;
			break;
		
		case EnemyOneType.Crazy:
			Idle0 = spr_enemy_0_brain_idle_0; Walk0 = spr_enemy_0_brain_walk_0;
			Idle1 = spr_enemy_0_brain_idle_0; Walk1 = spr_enemy_0_brain_walk_1;
			Idle2 = spr_enemy_0_brain_idle_0; Walk2 = spr_enemy_0_brain_walk_2;
			break;
			
		default:
			Idle0 = spr_enemy_0_idle_0; Walk0 = spr_enemy_0_walk_0;
			Idle1 = spr_enemy_0_idle_1; Walk1 = spr_enemy_0_walk_1;
			Idle2 = spr_enemy_0_idle_2; Walk2 = spr_enemy_0_walk_2;
			break;
	}
	
	if (headless){
		Idle0 = spr_enemy_0_headless_idle_0; Walk0 = spr_enemy_0_headless_walk_0;
		Idle1 = spr_enemy_0_headless_idle_1; Walk1 = spr_enemy_0_headless_walk_1;
		Idle2 = spr_enemy_0_headless_idle_2; Walk2 = spr_enemy_0_headless_walk_2;
	}
	
	if (speed_final < 0.1){
		scr_pawn_sprite_weapon(global.pawnweapon_realindex[weapon_index], Idle1, Idle0, Idle2);
	}else{
		scr_pawn_sprite_weapon(global.pawnweapon_realindex[weapon_index], Walk1, Walk0, Walk2);
	}
}

if (speed_final < 0.1) || (!instance_exists(target)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else if (speed_final >= 0.1) && (speed_final <= 0.75){
    image_speed = 0.15;
}else if (speed_final < 1.1) && (speed_final > 0.75){
    image_speed = 0.25;
}else if (speed_final >= 1.1){
    image_speed = 0.35;
}