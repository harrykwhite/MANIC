if (i_blendTime > 0){
	gpu_set_fog(true, make_colour_rgb(163, 42, 45), 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, (1-(1 / i_blendTime)) * image_alpha * (1 - whiteflash_alpha));
	gpu_set_fog(false, c_black, 0, 0);
}

if (global.player_healthCurrent <= 2){
	var glowAlpha = wave(0.15, 0.25, 2, 0);
	if (global.game_pause == false) && (global.cutscene_current == -1){
	    if (random(3)<1){
	        part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-14, 14), global.pt_blood_2, 1);
	    }
	}
    
    gpu_set_fog(true, make_colour_rgb(117, 39, 39), 0, 0);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, glowAlpha * image_alpha * (1 - whiteflash_alpha));
    gpu_set_fog(false, c_black, 0, 0);
	draw_set_alpha(1);
}

if (whiteflash_alpha > 0){
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, whiteflash_alpha * image_alpha);
	gpu_set_fog(false, c_black, 0, 0);
}

if (burn){
	scr_draw_burn(6, 18, x, y + 3, image_alpha);
}

if (poison){
	scr_draw_poison(6, 18, x, y + 3, image_alpha);
}