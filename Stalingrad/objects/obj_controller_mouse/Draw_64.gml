var xx, yy, scale;
xx = (mouse_x - camera_get_view_x(view_camera[0])) * GUI_POS_X;
yy = (mouse_y - camera_get_view_y(view_camera[0])) * GUI_POS_Y;
scale = 3;

switch(mouse){
	case MouseType.SmallCrosshair:
		var space = (mouse_scale * 4 * scale);
		var length = 4 * scale;
		
		for(var i = 0; i < 4; i++){
			var selfir = (360 / 4) * i;
			draw_set_alpha(mouse_alpha * 0.75);
			draw_set_colour(c_white);
			draw_line_width(xx + lengthdir_x(space / 2, selfir), yy + lengthdir_y(space / 2, selfir), xx + lengthdir_x((space / 2) + length, selfir), yy + lengthdir_y((space / 2) + length, selfir), scale);
			draw_set_alpha(1);
		}
		
		break;
	
	case MouseType.Crosshair:
		var space = (mouse_scale * 9 * scale);
		var length = 6 * scale;
		
		for(var i = 0; i < 4; i++){
			var selfir = (360 / 4) * i;
			draw_set_alpha(mouse_alpha * 0.75);
			draw_set_colour(c_white);
			draw_line_width(xx + lengthdir_x(space / 2, selfir), yy + lengthdir_y(space / 2, selfir), xx + lengthdir_x((space / 2) + length, selfir), yy + lengthdir_y((space / 2) + length, selfir), scale);
			draw_set_alpha(1);
		}
		
		break;
	
	case MouseType.SmallCircle:
		draw_set_alpha(mouse_alpha * 0.75);
		draw_set_colour(c_white);
		draw_circle_width(xx, yy, mouse_scale * 4 * scale, scale, 100);
		draw_set_alpha(1);
		break;
	
	case MouseType.LargeCircle:
		draw_set_alpha(mouse_alpha * 0.75);
		draw_set_colour(c_white);
		draw_circle_width(xx, yy, mouse_scale * 7.5 * scale, scale, 100);
		draw_set_alpha(1);
		break;
	
	case MouseType.NoAmmo:
	
		var space = (mouse_scale * 9 * scale);
		var length = 6 * scale;
		
		for(var i = 0; i < 4; i++){
			var selfir = ((360 / 4) * i) + 45;
			draw_set_alpha(mouse_alpha * 0.75);
			draw_set_colour(make_colour_rgb(255, 32, 32));
			draw_line_width(xx + lengthdir_x(space / 2, selfir), yy + lengthdir_y(space / 2, selfir), xx + lengthdir_x((space / 2) + length, selfir), yy + lengthdir_y((space / 2) + length, selfir), scale);
			draw_set_alpha(1);
		}
		
		break;
}
