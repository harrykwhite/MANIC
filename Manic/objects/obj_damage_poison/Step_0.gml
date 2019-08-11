image_xscale = width / sprite_get_width(sprite_index);
image_yscale = height / sprite_get_height(sprite_index);

if (!spawned){
	repeat(6){
		part_type_life(global.pt_toxic_0, time - 20, time + 40);
		part_type_speed(global.pt_toxic_0, 0.75, 1.75, -0.025, 0);
		part_particles_create(global.ps_front, x, y, global.pt_toxic_0, 1);
	}
	
	spawned = true;
}

if (random(3) < 1){
	part_particles_create(global.ps_front, random_range(x - (sprite_width / 2), x + (sprite_width / 2)), random_range(y - (sprite_height / 2), y + (sprite_height / 2)), choose(global.pt_poison_0, global.pt_poison_1), 1);
}

if (time > 0){
	time--;
}else{
	instance_destroy();
}