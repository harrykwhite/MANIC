if (global.game_pause) || (enemy && global.cutscene_current != -1){
	image_speed = 0;
	return;
}

image_speed = 0.2;
image_angle = dir;
dir += random_range(-5, 5);
part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_fire_0, 2);

if (random(5) < 1){
	part_particles_create(global.ps_front, x + random_range(-2, 2), y + random_range(-2, 2), global.pt_smoke_3, 1);
}

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

if (spd > 0){
	spd -= random_range(0.5, 1);
}else{
	instance_destroy();
}