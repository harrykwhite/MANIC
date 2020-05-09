if (global.game_pause) || (enemy && global.cutscene_current != -1){
	image_speed = 0;
	return;
}

if (place_meeting(x + 1, y + 1, obj_p_solid)){
	explode = true;
}

if (instance_exists(target)){
	var dir_to_target = point_direction(x, y, target.x, target.y);
	var dir_from_target = angle_difference(dir, dir_to_target);
	
	dir += 0.75 * -sign(dir_from_target);
	image_angle = dir;
}

part_type_speed(global.pt_smoke_6, 2, 4, -0.1, 0);
part_type_direction(global.pt_smoke_6, (dir - 180) - 10, (dir - 180) + 10, 0, 0);
part_particles_create(global.ps_front, x + lengthdir_x(-5, dir), y + lengthdir_y(-5, dir), global.pt_smoke_6, 1);

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

part_particles_create(global.ps_front, x, y, global.pt_fire_0, 1);

if (explode){
	scr_explode_effects(60, damage, !enemy, enemy, true);
	instance_destroy();
}