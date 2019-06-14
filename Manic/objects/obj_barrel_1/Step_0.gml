if (global.game_pause){
	image_speed = 0;
	return;
}

if (burn_sound == noone){
	burn_sound = scr_sound_play(snd_character_burn_0, true, 1, 1);
}

scr_sound_set_distance(burn_sound, 110);
image_speed = 1;

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
mylight.x = x;
mylight.y = y;
mylight.light[| eLight.X] = x;
mylight.light[| eLight.Y] = y - 3;
mylight.light[| eLight.LutIntensity] = 1.45;
mylight.light[| eLight.Flags] |= eLightFlags.Dirty;

// Object Death
if (death){
	scr_sound_play_distance_pitch(snd_object_box_break_0, false, 240, 0.8, 1.2);
	
	var fl = instance_create(x, y - 6, obj_block_light);
	fl.mylight[0] = noone; fl.size[0] = 100;
	fl.fadeSpeed = 0.015;
	
    instance_destroy();
    scr_effect_screenshake(3);
	scr_effect_freeze(8);
	scr_effect_vignette_flash(c_ltgray, 0.1, 0.01);
	part_type_direction(global.pt_wood_2, 0, 360, 0, 0);
    repeat(15)part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-8, 8), global.pt_wood_2, 1);
	
	scr_weapon_ammo_spawn(2, 6, 5, x, y + 6);
	
	if (random(3) < 1){
		instance_create(x, y + 8, obj_health_pack_0);
	}
	
	if (global.level_current >= 2){
		if (random(5) < 1){
			var weapon = instance_create(x, y + 8, obj_weapondrop);
			weapon.index = choose(PlayerWeapon.Grenade);
			weapon.angle = random_range(20, 40);
			weapon.pack = true;
			weapon.quantity = random_range(2, 3);
		}
	}
	
	var brk = instance_create(x, y, obj_break); brk.shake = 3; brk.sprite_index = spr_barrel_0_break;
}

