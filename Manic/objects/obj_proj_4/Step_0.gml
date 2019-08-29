if (global.game_pause) || (enemy && global.cutscene_current != -1){
	image_speed = 0;
	return;
}

image_speed = 0.15;
image_angle = dir;
part_particles_create(global.ps_front, x, y, global.pt_fire_0, 1);

if (random(5) < 1){
	part_particles_create(global.ps_front, x + random_range(-2, 2), y + random_range(-2, 2), global.pt_smoke_3, 1);
}

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);