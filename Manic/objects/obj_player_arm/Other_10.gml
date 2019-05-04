if (obj_player.canmove){
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * obj_player.i_time_alpha);
	scr_draw_attributes_player_arm();
}