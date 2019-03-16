if (grain_alpha > 0){
	var xpos = camera_get_view_x(view_camera[0]);
	var ypos = camera_get_view_y(view_camera[0]);
	var width = camera_get_view_width(view_camera[0]);
	var height = camera_get_view_height(view_camera[0]);
	var cellwidth = 144;
	var cellheight = 144;
	var light = false;
	draw_set_colour(c_white);

	for(var yy = 0; yy < height; yy += cellheight){
		for(var xx = 0; xx < width; xx += cellwidth){
			var _x = xx + xpos;
			var _y = yy + ypos;
		
			draw_set_alpha(random_range(0.040, 0.070) * grain_alpha);
			draw_sprite(spr_ui_grain, grain_image, _x, _y);
		}
	}
	
	grain_image += 0.5;
	grain_alpha -= 0.005;
	draw_set_alpha(1);
}