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

for(var len = 0; len < spd; len ++){
	var colat = instance_place(x - lengthdir_x(9 + spd, dir), y - lengthdir_y(9 + spd, dir), obj_p_solid);
	
	if (colat != noone){
		if (colat.object_index != obj_p_depth_environhit) && (object_get_parent(colat.object_index) != obj_p_depth_environhit){
			deffect = true;
			instance_destroy();
			return;
		}
	}
	
	x += lengthdir_x(1, dir);
	y += lengthdir_y(1, dir);
}