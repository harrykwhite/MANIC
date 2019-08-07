if (global.game_pause){
	image_speed = 0;
	exit;
}

if (fire){
	sprite_index = spr_chair_destroyed_0;
	image_speed = 1;
	
	if (random(9) < 1){
		part_particles_create(global.ps_front, x + random_range(-3, 3), y - 3, global.pt_smoke_3, 1);
	}
}