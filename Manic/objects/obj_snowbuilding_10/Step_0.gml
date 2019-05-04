scr_interior_fade();
depth_offset = 1400;

if (image_alpha > 0.2){
	if (smoke_time > 0){
		smoke_time --;
	}else{
		smoke_time = random_range(30, 40);
	
		repeat(3){
			part_particles_create(global.ps_front, x + (sprite_width / 2) + random_range(-5, 5), y + random_range(7, 11), global.pt_smoke_7, 1);
		}
	}
}