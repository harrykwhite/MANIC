if (deffect){
	part_type_color1(global.pt_bullet_bounce_0, c_white);
	part_type_direction(global.pt_bullet_bounce_0, (dir - 180) - 22, (dir - 180) + 22, 0, 0);
	part_particles_create(global.ps_bottom, x + lengthdir_x(14, dir), y + lengthdir_y(14, dir), global.pt_bullet_bounce_0, 4);
}