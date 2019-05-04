var xx = scr_world_to_screen_x(x);
var yy = scr_world_to_screen_y(y);
var scale = 2;
var counter = 0;

switch(mouse){
	case MouseType.SmallCrosshair:
		var space = (mouse_scale * 5 * scale);
		var length = 4 * scale;
		
		repeat(4){
			var selfdir = (360 / 4) * counter;
			draw_set_alpha(mouse_alpha * 0.75);
			draw_set_colour(c_white);
			draw_line_width(xx + lengthdir_x(space / 2, selfdir), yy + lengthdir_y(space / 2, selfdir), xx + lengthdir_x((space / 2) + length, selfdir), yy + lengthdir_y((space / 2) + length, selfdir), scale);
			
			draw_set_alpha(mouse_cross * mouse_alpha * 0.25);
			draw_line_width(xx + lengthdir_x(space / 2, selfdir + 45), yy + lengthdir_y(space / 2, selfdir + 45), xx + lengthdir_x((space / 2) + (length * 0.75), selfdir + 45), yy + lengthdir_y((space / 2) + (length * 0.75), selfdir + 45), scale);
			
			draw_set_alpha(1);
			counter ++;
		}
		
		break;
	
	case MouseType.Crosshair:
		var space = (mouse_scale * 12 * scale);
		var length = 5 * scale;
		
		repeat(4){
			var selfdir = (360 / 4) * counter;
			draw_set_alpha(mouse_alpha * 0.75);
			draw_set_colour(c_white);
			draw_line_width(xx + lengthdir_x(space / 2, selfdir), yy + lengthdir_y(space / 2, selfdir), xx + lengthdir_x((space / 2) + length, selfdir), yy + lengthdir_y((space / 2) + length, selfdir), scale);
			draw_rectangle(xx, yy, xx + 1, yy + 1, false);
			
			draw_set_alpha(mouse_cross * mouse_alpha * 0.5);
			draw_line_width(xx + lengthdir_x(space / 2, selfdir + 45), yy + lengthdir_y(space / 2, selfdir + 45), xx + lengthdir_x((space / 2) + (length * 0.75), selfdir + 45), yy + lengthdir_y((space / 2) + (length * 0.75), selfdir + 45), scale);
			
			draw_set_alpha(1);
			counter ++;
		}
		
		break;
	
	case MouseType.SmallCircle:
		draw_set_alpha(mouse_alpha * 0.85);
		draw_set_colour(c_white);
		draw_circle(xx, yy, mouse_scale * 4 * scale, true);
		draw_circle(xx, yy, (mouse_scale * 4 * scale) + 0.5, true);
		draw_circle(xx, yy, (mouse_scale * 4 * scale) + 1, true);
		draw_set_alpha(1);
		break;
	
	case MouseType.LargeCircle:
		draw_set_alpha(mouse_alpha * 0.85);
		draw_set_colour(c_white);
		draw_circle(xx, yy, mouse_scale * 7.5 * scale, true);
		draw_circle(xx, yy, (mouse_scale * 7.5 * scale) + 0.5, true);
		draw_circle(xx, yy, (mouse_scale * 7.5 * scale) + 1, true);
		draw_set_alpha(1);
		break;
	
	case MouseType.Dot:
		var size = mouse_scale * scale;
		
		draw_set_alpha(mouse_alpha * 0.85);
		draw_set_colour(c_white);
		draw_rectangle(xx - size, yy - size, xx + size, yy + size, false);
		draw_set_alpha(1);
		break;
	
	case MouseType.NoAmmo:
		var space = (mouse_scale * 9 * scale);
		var length = 6 * scale;
		
		repeat(4){
			var selfdir = ((360 / 4) * counter) + 45;
			draw_set_alpha(mouse_alpha * 0.75);
			draw_set_colour(make_colour_rgb(255, 32, 32));
			draw_line_width(xx + lengthdir_x(space / 2, selfdir), yy + lengthdir_y(space / 2, selfdir), xx + lengthdir_x((space / 2) + length, selfdir), yy + lengthdir_y((space / 2) + length, selfdir), scale);
			draw_set_alpha(1);
			counter ++;
		}
		
		break;
}
