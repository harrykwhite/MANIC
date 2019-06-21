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

if (grav < 8){
	grav += 0.0075;
	y += grav;
}else{
	destroy = true;
}

if (spd > 0){
	spd -= random_range(0.01, 0.02);
}else{
	destroy = true;
}

if (destroy) || (place_meeting(x + 1, y + 1, obj_p_solid)){
	part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_poison_0, 1);
	part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_poison_2, 1);
	instance_destroy();
}