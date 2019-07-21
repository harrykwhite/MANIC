var cw = obj_controller_gameplay.pathgrid_cell_width;
var ch = obj_controller_gameplay.pathgrid_cell_height;

var height = room_height div ch;

var thisx = (x div cw);
var thisy = (y div ch);

while(mp_grid_get_cell(obj_controller_gameplay.pathgrid, thisx, thisy) == -1){
	thisy++;
	
	if (thisy >= height - 1){
		break;
	}
}

thisx *= cw;
thisy *= ch;

var gx = (move_x_to div cw);
var gy = (move_y_to div ch);

while(mp_grid_get_cell(obj_controller_gameplay.pathgrid, gx, gy) == -1){
	gy++;
	
	if (gy >= height - 1){
		break;
	}
}

var fakex = gx * cw;
var fakey = gy * ch;

if (mp_grid_path(obj_controller_gameplay.pathgrid, mypath, thisx, thisy, fakex, fakey, true)){
	var xx = path_get_point_x(mypath, 1), yy = path_get_point_y(mypath, 1);
	mp_potential_step_object(xx, yy, move_speed_real, obj_p_solid);
}