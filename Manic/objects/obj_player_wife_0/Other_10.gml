if (interact){
	var xoff = sprite_get_xoffset(sprite_index);
	var yoff = sprite_get_yoffset(sprite_index);
	
	gpu_set_fog(true, outlinewhite, 0, 0);
	draw_sprite_part_ext(sprite_index, image_index, 0, 0, 28, 21, (x - 1) - (xoff * image_xscale), y - (yoff * image_yscale), image_xscale, image_yscale, image_blend, image_alpha);
	draw_sprite_part_ext(sprite_index, image_index, 0, 0, 28, 21, (x + 1) - (xoff * image_xscale), y - (yoff * image_yscale), image_xscale, image_yscale, image_blend, image_alpha);
	draw_sprite_part_ext(sprite_index, image_index, 0, 0, 28, 21, x - (xoff * image_xscale), (y - 1) - (yoff * image_yscale), image_xscale, image_yscale, image_blend, image_alpha);
	draw_sprite_part_ext(sprite_index, image_index, 0, 0, 28, 21, x - (xoff * image_xscale), (y + 1) - (yoff * image_yscale), image_xscale, image_yscale, image_blend, image_alpha);
	gpu_set_fog(false, c_black, 0, 0);
}

draw_self();