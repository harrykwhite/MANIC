if (grain_alpha > 0){
	var xpos = camera_get_view_x(view_camera[0]);
	var ypos = camera_get_view_y(view_camera[0]);
	var width = camera_get_view_width(view_camera[0]);
	var height = camera_get_view_height(view_camera[0]);
	var cellwidth = 32;
	var cellheight = 32;
	var light = false;
	draw_set_colour(c_ltgray);

	for(var yy = 0; yy < height; yy += cellheight){
		for(var xx = 0; xx < width; xx += cellwidth){
			var _x = xx + xpos;
			var _y = yy + ypos;
		
			draw_set_alpha(random_range(0.07, 0.1) * grain_alpha);
			draw_rectangle(_x, _y, _x + cellwidth - 1, _y + cellheight - 1, false);
		}
	}
	
	grain_image ++;
	grain_alpha -= 0.005;
	draw_set_alpha(1);
}