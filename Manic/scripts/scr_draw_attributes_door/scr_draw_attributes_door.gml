if (locked) && (!open){
	if (interact){
		gpu_set_fog(true, outlinewhite, 0, 0);
		draw_sprite_ext(spr_door_lock_0, locked_img, x + 1, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * locked_img_alpha);
		draw_sprite_ext(spr_door_lock_0, locked_img, x - 1, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * locked_img_alpha);
		draw_sprite_ext(spr_door_lock_0, locked_img, x, y + 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha * locked_img_alpha);
		draw_sprite_ext(spr_door_lock_0, locked_img, x, y - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha * locked_img_alpha);
		gpu_set_fog(false, c_black, 0, 0);
	}
	
	draw_sprite_ext(spr_door_lock_0, locked_img, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * locked_img_alpha);
}