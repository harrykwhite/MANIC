var speed_multiplier = 1;
var speed_final = 0;
var face_player = true;
target = global.player;

if (instance_exists(target)){
	if (move_time > 0){
		move_time--;
	}else{
		move_xTo = global.player.x + random_range(-50, 50);
		move_yTo = global.player.y + random_range(-50, 50);
		weapon.attack = true;
		move_time = weapon.attack_time_max / 4;
		
		while(distance_to_point(move_xTo, move_yTo) < 20){
			move_xTo = global.player.x + random_range(-50, 50);
			move_yTo = global.player.y + random_range(-50, 50);
		}
	}
	
	move_speed = 1.4;
	if (distance_to_point(move_xTo, move_yTo) < 18){
		move_speed = 0;
	}
	
	move_dir = point_direction(x, y, move_xTo, move_yTo);
	weapon.dir = point_direction(x, y, target.x, target.y + 6);
}else{
	move_speed = 0;
	face_player = false;
}

// Off - screen movement.
x = clamp(x, 22, room_width - 22);
y = clamp(y, 22, room_height - 22);

if (!onscreen(x, y)){
	speed_multiplier = 0;
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
speed_final = move_speed * speed_multiplier * move_speed_offset ;

if (move_speed_real < speed_final){
    move_speed_real += 0.2;
}else if (move_speed_real > speed_final){
    move_speed_real -= 0.2;
}

mp_potential_step_object(move_xTo, move_yTo, move_speed_real, obj_p_solid);

// Facing
if (face_player == false){
	if (move_xTo > x){
		image_xscale = scale;
	}else{
		image_xscale = -scale;
	}
}else{
	if (target.x > x){
		image_xscale = scale;
	}else{
		image_xscale = -scale;
	}
}

// Animation
if (instance_exists(weapon)){
	var Idle0, Walk0;
	var Idle1, Walk1;
	var Idle2, Walk2;
	
	Idle0 = spr_thedogkeeper_idle_0; Walk0 = spr_thedogkeeper_idle_0;
	Idle1 = spr_thedogkeeper_idle_1; Walk1 = spr_thedogkeeper_walk_1;
	Idle2 = spr_thedogkeeper_idle_1; Walk2 = spr_thedogkeeper_walk_1;
	
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