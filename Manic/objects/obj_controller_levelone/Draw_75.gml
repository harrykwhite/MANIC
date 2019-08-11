if (factory_explode){
	if (factory_explode_alpha > 0){
		factory_explode_alpha -= 0.025;
		scr_effect_screenshake(5);
	}else{
		factory_explode = false;
		factory_explode_alpha = 0;
	}
	
	draw_set_alpha(factory_explode_alpha);
	draw_set_colour(c_white);
	draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
}else{
	factory_explode_alpha = factory_explode_alpha_max;
}