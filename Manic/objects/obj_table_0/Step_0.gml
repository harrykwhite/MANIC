if (global.game_pause){
	image_speed = 0;
	exit;
}

if (fire){
	sprite_index = spr_table_destroyed_0;
	image_speed = 1;
	
	if (random(5) < 1){
		part_particles_create(global.ps_front, x + random_range(-6, 6), y - 4, global.pt_smoke_3, 1);
	}
}