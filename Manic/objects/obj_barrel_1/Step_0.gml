if (global.game_pause){
	image_speed = 0;
	return;
}else{
	image_speed = 1;
}

// Flash
flash -= 0.15;
flash = clamp(flash, 0, 1);

// Motion
if (spd > 0.375){
	if (!place_meeting(x + lengthdir_x(spd + 3, dir), y + lengthdir_y(spd + 3, dir), obj_p_pawn)){
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}
	
	spd *= 0.9;
}else{
	if (point_distance(x, y, basex, basey) >= 1){
		var dirto = point_direction(x, y, basex, basey);
		if (!place_meeting(x + lengthdir_x(3, dirto), y + lengthdir_y(3, dirto), obj_p_pawn)){
			x += lengthdir_x(abs(basex - x) * 0.1, dirto);
			y += lengthdir_y(abs(basey - y) * 0.1, dirto);
		}
	}else{
		x = basex;
		y = basey;
	}
}

// Hit Control
if (hit <= 0){
	death = true;
}

if (hit_time > 0){
	hit_time--;
}

// Light
if (!instance_exists(mylight)){
	mylight = instance_create_layer(x, y - 3, "Lights", obj_barrel_1_light);
}

scr_env_burn_effects(0, -3, 4, 4, 85);

mylight.x = x;
mylight.y = y - 3;
mylight.Light_Intensity = 1.45;
mylight.Light_Range = 115;

// Object Death
if (death){
	scr_env_destroy(spr_barrel_0_break);
	
	scr_weapon_ammo_spawn(2, 5, 3, x, y + 8);

	if (random(4) < 1){
		instance_create(x, y + 8, obj_health_pack_0);
	}

	if (scr_object_spawn_grenade()){
		if (random(9) < 1){
			var weapon = instance_create(x, y + 8, obj_weapondrop);
			weapon.index = PlayerWeapon.Grenade;
			
			if (!scr_level_is_arena()){
				if (global.level_current >= Level.HumanPrison){
					weapon.index = choose(PlayerWeapon.Grenade, PlayerWeapon.Grenade, PlayerWeapon.ReinforcedGrenade);
				}
				
				if (global.level_current >= Level.TrainStation){
					weapon.index = choose(PlayerWeapon.Grenade, PlayerWeapon.ReinforcedGrenade, PlayerWeapon.LandMine);
				}
			}
			
			weapon.angle = random_range(-10, 10);
			weapon.pack = true;
			weapon.quantity = random_range(2, 3);
		}
	}
}