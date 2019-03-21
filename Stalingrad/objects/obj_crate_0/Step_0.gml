// Flash
flash -= 0.15;
flash = clamp(flash, 0, 1);

// Hit Control
if (hit <= 0){
	death = true;
}

if (hit_time > 0){
	hit_time--;
}

// Motion
if (spd > 0.01){
	var col_list, col_length, can_move;
	col_list[0] = obj_p_solid;
	col_list[1] = obj_p_enemy;
	col_list[2] = obj_p_player;
	col_length = array_length_1d(col_list);
	can_move = true;
	
	for(var i = 0; i < col_length; i ++){
		if (place_meeting(x + lengthdir_x(spd + 1, dir), y + lengthdir_y(spd, dir), col_list[i])){
			can_move = false;
			break;
		}
	}
	
	if (can_move){
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}
	
	spd *= 0.9;
}

// Object Death
if (death){
	scr_sound_play(snd_object_box_break_0, false, 0.8, 1.2);
    instance_destroy();
    scr_effect_screenshake(3);
	scr_effect_freeze(8);
	scr_effect_vignette_flash(c_white, 0.1, 0.02);
	part_type_direction(global.pt_wood_2, 0, 360, 0, 0);
    repeat(15)part_particles_create(global.ps_front, x + random_range(-7, 7), y + random_range(-7, 7), global.pt_wood_2, 1);
	var brk = instance_create(x, y, obj_break); brk.shake = 3; brk.sprite_index = spr_crate_0_break;
	
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
}

