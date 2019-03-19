// Drawing Shadow
draw_sprite_ext(spr_enemy_3_stand_0, 0, x, y, image_yscale, scale, 0, c_white, 1);

if (i_blend_time > 0){
	var colour = make_colour_rgb(163, 42, 45);
	if (object_index == obj_enemy_3) || (object_index == obj_giantturret) || (object_index == obj_giantturret_flamethrower){
		colour = c_white
	}
	
	gpu_set_fog(true, colour, 0, 0);
	draw_sprite_ext(spr_enemy_3_stand_0, 0, x, y, image_yscale, scale, 0, c_white, ((1-(1 / i_blend_time)) * image_alpha) + 0.1);
	gpu_set_fog(false, c_black, 0, 0);
}