if (global.game_pause){
	image_speed = 0;
	exit;
}

if (place_meeting(x + 1, y + 1, obj_p_solid)){
	explode = true;
}

if (instance_exists(target)){
	var dir_to_target = floor(point_direction(x, y, target.x, target.y));
	
	if (dir < dir_to_target){
		dir ++;
	}else if (dir > dir_to_target){
		dir --;
	}
	
	image_angle = dir;
}

part_type_speed(global.pt_smoke_8, 2, 4, -0.1, 0);
part_type_direction(global.pt_smoke_8, (dir - 180) - 10, (dir - 180) + 10, 0, 0);
part_particles_create(global.ps_front, x + lengthdir_x(-5, dir), y + lengthdir_y(-5, dir), global.pt_smoke_8, 1);

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

if (explode){
    repeat(9){
        part_particles_create(global.ps_front, x + random_range(-22, 22), y + random_range(-22, 22), global.pt_smoke_2, 1);
    }
	
	repeat(2){
        part_particles_create(global.ps_front, x + random_range(-42, 42), y + random_range(-42, 42), global.pt_smoke_2, 1);
    }
    
	part_particles_create(global.ps_front, x, y, global.pt_fire_1, 17);
	
	var fl = instance_create(x, y, obj_block_light);
	fl.mylight[0] = noone; fl.size[0] = 100;
	fl.fadeSpeed = 0.015;
	
    instance_destroy();
    scr_damage_custom(damage, 1, 45, 45, 3, enemy, !enemy, true, true);
	scr_damage_custom(round(damage / 2), 1, 60, 60, 3, enemy, !enemy, true, true);
    scr_effect_screenshake(6);
	scr_effect_freeze(5);
	scr_effect_vignette_flash(c_white, 0.4, 0.02);
	scr_sound_play_distance(snd_weapon_explode_0, false, 400);
}