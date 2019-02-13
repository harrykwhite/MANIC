if (global.game_pause){
	image_speed = 0;
	exit;
}

image_speed = 0.2;
image_angle = dir;
dir += random_range(-5, 5);
part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_fire_0, 2);

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

if (spd > 0){
	spd -= random_range(0.5, 1);
}else{
	instance_destroy();
}

if (collision_line(xstart, ystart, x, y, obj_p_solid, false, true)){
	part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_fire_0, 2);
	part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_fire_2, 2);
	instance_destroy();
}