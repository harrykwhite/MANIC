if (locked) && (!open){
	draw_sprite_ext(spr_door_lock_0, locked_img, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * locked_img_alpha);
}