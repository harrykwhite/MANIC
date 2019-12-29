// Camera data
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var camw = ceil(camera_get_view_width(view_camera[0]));
var camh = ceil(camera_get_view_height(view_camera[0]));

// Surface handling
if (!surface_exists(global.game_lighting)){
	global.game_lighting = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
}

if (surface_get_width(global.game_lighting) != camw) || (surface_get_height(global.game_lighting) != camh){
	surface_resize(global.game_lighting, camw, camh);
}

// Draw darkness
var lighting_lvl = global.game_lighting_level;
var lighting_col = make_colour_rgb(lighting_lvl * 255, lighting_lvl * 255, lighting_lvl * 255);

surface_set_target(global.game_lighting);

draw_set_colour(lighting_col);
draw_rectangle(0, 0, camw, camh, false);

surface_reset_target();

// Iterate through all lights in the room, draw lights to the surface
with(obj_light){
	var thisx = x - camx;
	var thisy = y - camy;
	
	var colred = color_get_red(Light_Colour);
	var colgreen = color_get_green(Light_Colour);
	var colblue = color_get_blue(Light_Colour);
	
	var range = Light_Range * (Light_Intensity + ((Light_Intensity - 1) / 4));
	
	gpu_set_blendmode(bm_subtract);
	surface_set_target(global.game_lighting);
	
	switch(Light_Type){
		case "Point Light":
			draw_ellipse_color(thisx - (range / 3), thisy - (range / 3), thisx + (range / 3), thisy + (range / 3), Light_Colour, c_black, false);
			draw_ellipse_color(thisx - (range / 2), thisy - (range / 2), thisx + (range / 2), thisy + (range / 2), merge_color(Light_Colour, c_black, 0.3), c_black, false);
			break;
		
		case "Directional Light":
			var xx, yy, col;
			var newrange = range;
			var colmult = 1;
			
			for(var len = 0; len < Light_Length; len += 20){
				xx = thisx + lengthdir_x(len, Light_Direction);
				yy = thisy + lengthdir_y(len, Light_Direction);
				col = make_colour_rgb(colred * colmult, colgreen * colmult, colblue * colmult);
				
				newrange += 4;
				colmult *= 0.8;
				
				draw_ellipse_color(xx - (newrange / 3), yy - (newrange / 3), xx + (newrange / 3), yy + (newrange / 3), col, c_black, false);
				draw_ellipse_color(xx - (newrange / 2), yy - (newrange / 2), xx + (newrange / 2), yy + (newrange / 2), merge_color(col, c_black, 0.3), c_black, false);
				
				//draw_ellipse_color(xx - (newrange / 2.5), yy - (newrange / 2.5), xx + (newrange / 2.5), yy + (newrange / 2.5), col, c_black, false);
				//draw_ellipse_color(xx - (newrange / 2), yy - (newrange / 2), xx + (newrange / 2), yy + (newrange / 2), merge_color(col, c_black, 0.3), c_black, false);
			}
			break;
	}
	
	surface_reset_target();
	gpu_set_blendmode(bm_normal);
}

// Draw the lighting onto the screen
gpu_set_blendmode(bm_subtract);
draw_surface(global.game_lighting, camx, camy);
gpu_set_blendmode(bm_normal);