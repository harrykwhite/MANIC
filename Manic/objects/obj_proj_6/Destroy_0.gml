if (deffect){
	part_type_color1(global.pt_bullet_bounce_0, c_gray);
	part_type_direction(global.pt_bullet_bounce_0, (dir - 180) - 17, (dir - 180) + 17, 0, 0);
	part_particles_create(global.ps_bottom, x + lengthdir_x(5, dir), y + lengthdir_y(5, dir), global.pt_bullet_bounce_0, 3);
}