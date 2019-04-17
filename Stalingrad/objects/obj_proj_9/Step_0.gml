var destroy = false;

if (global.game_pause){
	image_speed = 0;
	return;
}

image_speed = 0.2;
image_angle = dir;
dir += random_range(-1, 1);

if (random(3) < 1){
	part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_poison_0, 1);
}

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

if (grav < 6){
	grav += 0.05;
	y += grav;
}else{
	destroy = true;
}

if (spd > 0){
	spd -= random_range(0.2, 0.4);
}else{
	destroy = true;
}

if (collision_line(xstart, ystart, x, y, obj_p_solid, false, true)) or (destroy){
	part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_poison_0, 1);
	part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_poison_2, 1);
	instance_destroy();
}