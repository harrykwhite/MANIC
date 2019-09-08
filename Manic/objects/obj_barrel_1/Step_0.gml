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
	if (point_distance(x, y, basex, basey) > 1){
		var dirto = point_direction(x, y, basex, basey);
		if (!place_meeting(x + lengthdir_x(3, dirto), y + lengthdir_y(3, dirto), obj_p_pawn)){
			x += lengthdir_x(abs(basex - x) * 0.1, dirto);
			y += lengthdir_y(abs(basey - y) * 0.1, dirto);
		}
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
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y - 3;
mylight.light[| eLight.LutIntensity] = 1.45;
mylight.light[| eLight.Range] = 115;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

// Object Death
if (death){
	scr_env_destroy(spr_barrel_0_break);
	
	scr_weapon_ammo_spawn(6, 6, 5, x, y + 6);

	if (random(4) < 1){
		instance_create(x, y + 8, obj_health_pack_0);
	}

	if (global.level_current >= Level.UndergroundBunker){
		if (random(7) < 1){
			var weapon = instance_create(x, y + 6, obj_weapondrop);
			weapon.index = (global.level_current >= Level.TrainStation) ? choose(PlayerWeapon.Grenade, PlayerWeapon.LandMine) : PlayerWeapon.Grenade;
			weapon.angle = random_range(-10, 10);
			weapon.pack = true;
			weapon.quantity = random_range(2, 3);
		}
	}
}