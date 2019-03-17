var xx = (mouse_x - camera_get_view_x(view_camera[0])) * GUI_POS_X;
var yy = (mouse_y - camera_get_view_y(view_camera[0])) * GUI_POS_Y;
var scale = 2.25;
var counter = 0;

switch(mouse){
	case MouseType.SmallCrosshair:
		var space = (mouse_scale * 4 * scale);
		var length = 4 * scale;
		
		repeat(4){
			var selfir = (360 / 4) * counter;
			draw_set_alpha(mouse_alpha * 0.75);
			draw_set_colour(c_white);
			draw_line_width(xx + lengthdir_x(space / 2, selfir), yy + lengthdir_y(space / 2, selfir), xx + lengthdir_x((space / 2) + length, selfir), yy + lengthdir_y((space / 2) + length, selfir), scale);
			draw_set_alpha(1);
			counter++;
		}
		
		break;
	
	case MouseType.Crosshair:
		var space = (mouse_scale * 9 * scale);
		var length = 6 * scale;
		
		repeat(4){
			var selfir = (360 / 4) * counter;
			draw_set_alpha(mouse_alpha * 0.75);
			draw_set_colour(c_white);
			draw_line_width(xx + lengthdir_x(space / 2, selfir), yy + lengthdir_y(space / 2, selfir), xx + lengthdir_x((space / 2) + length, selfir), yy + lengthdir_y((space / 2) + length, selfir), scale);
			draw_set_alpha(1);
			counter++;
		}
		
		break;
	
	case MouseType.SmallCircle:
		draw_set_alpha(mouse_alpha * 0.75);
		draw_set_colour(c_white);
		draw_circle(xx, yy, mouse_scale * 4 * scale, true);
		draw_circle(xx, yy, (mouse_scale * 4 * scale) + 1, true);
		draw_circle(xx, yy, (mouse_scale * 4 * scale) + 2, true);
		draw_set_alpha(1);
		break;
	
	case MouseType.LargeCircle:
		draw_set_alpha(mouse_alpha * 0.75);
		draw_set_colour(c_white);
		draw_circle(xx, yy, mouse_scale * 7.5 * scale, true);
		draw_circle(xx, yy, (mouse_scale * 7.5 * scale) + 1, true);
		draw_circle(xx, yy, (mouse_scale * 7.5 * scale) + 2, true);
		draw_set_alpha(1);
		break;
	
	case MouseType.NoAmmo:
		var space = (mouse_scale * 9 * scale);
		var length = 6 * scale;
		
		repeat(4){
			var selfir = ((360 / 4) * counter) + 45;
			draw_set_alpha(mouse_alpha * 0.75);
			draw_set_colour(make_colour_rgb(255, 32, 32));
			draw_line_width(xx + lengthdir_x(space / 2, selfir), yy + lengthdir_y(space / 2, selfir), xx + lengthdir_x((space / 2) + length, selfir), yy + lengthdir_y((space / 2) + length, selfir), scale);
			draw_set_alpha(1);
			counter++;
		}
		
		break;
}
