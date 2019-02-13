if (global.player_healthCurrent <= 2){
    gpu_set_fog(true, make_colour_rgb(117, 39, 39), 0, 0);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, wave(0.15, 0.25, 2, 0) * image_alpha * (1 - global.player.whiteflash_alpha));
    gpu_set_fog(false, c_black, 0, 0);
}

if (global.player.burn){
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 0.125 * image_alpha);
	gpu_set_fog(false, c_black, 0, 0);
}

if (global.player.poison){
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 0.1 * image_alpha);
	gpu_set_fog(false, c_black, 0, 0);
}

if (global.player.whiteflash_alpha > 0){
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, global.player.whiteflash_alpha * image_alpha);
	gpu_set_fog(false, c_black, 0, 0);
}