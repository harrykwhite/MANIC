if (global.game_pause){
	image_speed = 0;
	return;
}

damage += damage_change;
damage = max(damage, 1);

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

if (destroy){
	part_type_color1(global.pt_bullet_bounce_0, c_white);
	part_type_direction(global.pt_bullet_bounce_0, (dir - 180) - 22, (dir - 180) + 22, 0, 0);
	part_particles_create(global.ps_bottom, x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), global.pt_bullet_bounce_0, 4);
	instance_destroy();
}