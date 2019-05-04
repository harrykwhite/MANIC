if (instance_exists(turret)){
	if (shoot){
		var ang = turret.flamethrower_angle + shoot_dir;
		var xpos = x + lengthdir_x(1, ang);
		var ypos = y + lengthdir_y(1, ang);
	
		part_type_direction(global.pt_flash_0, ang - 15, ang + 15, 0, 0);
		part_particles_create(global.ps_front, xpos + random_range(-3, 3), ypos + random_range(-3, 3), global.pt_flash_0, 1);
		part_type_direction(global.pt_smoke_5, ang - 15, ang + 15, 0, 0);
		part_particles_create(global.ps_front, xpos + lengthdir_x(8, ang) + random_range(-3, 3), ypos + lengthdir_y(8, ang) + random_range(-3, 3), global.pt_smoke_5, 1);
	
		repeat(choose(3, 4)){
			var flame = instance_create(xpos, ypos, obj_proj_5);
			flame.dir = ang + random_range(-1, 1);
			flame.image_xscale = 0.9;
			flame.image_yscale = 0.9;
			flame.image_angle = flame.dir;
			flame.damage = 2;
			flame.strength = 1.5;
			flame.spd = random_range(10, 14);
			flame.enemy = true;
		}
	
		shoot = false;
	}
}else{
	shoot = false;
}