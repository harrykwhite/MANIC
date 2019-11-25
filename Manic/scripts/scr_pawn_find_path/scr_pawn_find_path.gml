///@param domove
var domove = true;

if (argument_count > 0){
	domove = argument[0];
}

var cw = obj_controller_gameplay.pathgrid_cell_width;
var ch = obj_controller_gameplay.pathgrid_cell_height;
var success = false;

var width = room_width div cw;
var height = room_height div ch;

var thisx = (x div cw);
var thisy = ((y + 4) div ch);

var thisxaxis = sign((x / cw) - thisx);
var thisyaxis = sign(((y + 4) / ch) - thisy);

thisx = clamp(thisx, 0, width - 1);
thisy = clamp(thisy, 0, height - 1);

while(mp_grid_get_cell(obj_controller_gameplay.pathgrid, thisx, thisy) == -1){
	thisx += thisxaxis;
	thisy += thisyaxis;
	
	if (thisx < 0 || thisy < 0 || thisx >= width - 1 || thisy >= height - 1){
		thisx = clamp(thisx, 0, width - 1);
		thisy = clamp(thisy, 0, height - 1);
		break;
	}
}

thisx *= cw;
thisy *= ch;

var gx = (move_x_to div cw);
var gy = (move_y_to div ch);

var gxaxis = sign((move_x_to / cw) - gx);
var gyaxis = sign((move_y_to / ch) - gy);

gx = clamp(gx, 0, width - 1);
gy = clamp(gy, 0, height - 1);

while(mp_grid_get_cell(obj_controller_gameplay.pathgrid, gx, gy) == -1){
	gx += gxaxis;
	gy += gyaxis;
	
	if (gx < 0 || gy < 0 || gx >= width - 1 || gy >= height - 1){
		gx = clamp(gx, 0, width - 1);
		gy = clamp(gy, 0, height - 1);
		break;
	}
}

gx *= cw;
gy *= ch;

if (mp_grid_path(obj_controller_gameplay.pathgrid, mypath, thisx, thisy, gx, gy, true)){
	if (point_distance(x, y, gx, gy) > 4){
		if (domove){
			var xx = path_get_point_x(mypath, 2);
			var yy = path_get_point_y(mypath, 2);
			
			move_to_door = false;
			move_to_door_dir = 0;
			
			mp_potential_step_object(xx, yy, move_speed_real, obj_p_solid);
		}
		
		prevpath = mypath;
		success = true;
	}
}else{
	if (prevpath != noone){
		// Finding a door
		var length = path_get_number(prevpath);
		
		for(var i = 0; i < length; i ++){
			var px = path_get_point_x(prevpath, i);
			var py = path_get_point_y(prevpath, i);
		
			if (place_meeting(px, py, obj_p_depth_door)){
				var real_px = path_get_point_x(prevpath, max(0, i - 2));
				var real_py = path_get_point_y(prevpath, max(0, i - 2));
				var real_dist_p = distance_to_point(real_px, real_py);
				var dir_p = point_direction(x, y, px, py);
				
				if (domove){
					move_to_door = true;
					move_to_door_dir = dir_p;
				}
				
				if (real_dist_p < 35){
					if (object_index == obj_enemy_0){
						if (instance_exists(weapon)){
							weapon.attack = true;
							weapon.dir = dir_p;
							
							if (real_px > x){
								image_xscale = scale;
							}else{
								image_xscale = -scale;
							}
						}
					}
				}
				
				if (domove && real_dist_p > 30){
					mp_potential_step_object(real_px, real_py, move_speed_real, obj_p_solid);
					success = true;
				}
				
				break;
			}
		}
	}
}

return success;