if (global.game_pause){
	image_speed = 0;
	return;
}

image_speed = 0.15;
image_angle = dir;
part_particles_create(global.ps_front, x, y, global.pt_fire_0, 1);

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);