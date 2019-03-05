// Drawing Shadow
if (object_index != obj_enemy_3){
	draw_set_color(c_black);
	draw_set_alpha(0.24);

	if (object_index == obj_enemy_1){
		draw_set_alpha(0.16);
		draw_ellipse(x - (4 * scale), y + (20 * scale), x + (3 * scale), y + (22 * scale), false);
	}else if (object_index == obj_enemy_2) ||  (object_index == obj_thedogkeeper_dog) || (object_index == obj_thedogkeeper_dog) || (object_index == obj_companion_3){
		draw_set_alpha(0.3);
		draw_ellipse(x - (16 * scale), y + (10 * scale), x + (15 * scale), y + (17 * scale), false);
	}else{
		draw_ellipse(x - (10 * scale), y + (20 * scale), x + (9 * scale), y + (25 * scale), false);
	}

	draw_set_alpha(1);
}else{
	draw_sprite_ext(spr_enemy_3_stand_0, 0, x, y, image_yscale, scale, 0, c_white, 1);
}