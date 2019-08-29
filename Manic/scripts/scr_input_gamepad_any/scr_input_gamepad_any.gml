var ret_matrix = ds_grid_create(2, 1);
var gamepad_count = gamepad_get_device_count();

ds_grid_clear(ret_matrix, -1);

for(var gp = 0; gp < gamepad_count; gp ++){
	for(var b = gp_face1; b < gp_padr; b ++){
		if (gamepad_button_check(gp, b)){
			ret_matrix[# 0, 0] = gp;
			ret_matrix[# 1, 0] = b;
			break;
		}
	}
	
	if (abs(gamepad_axis_value(gp, gp_axislh)) > 0.4){
		ret_matrix[# 0, 0] = gp;
		ret_matrix[# 1, 0] = gp_axislh;
		break;
	}
	
	if (abs(gamepad_axis_value(gp, gp_axislv)) > 0.4){
		ret_matrix[# 0, 0] = gp;
		ret_matrix[# 1, 0] = gp_axislv;
		break;
	}
	
	if (abs(gamepad_axis_value(gp, gp_axisrh)) > 0.4){
		ret_matrix[# 0, 0] = gp;
		ret_matrix[# 1, 0] = gp_axisrh;
		break;
	}
	
	if (abs(gamepad_axis_value(gp, gp_axisrv)) > 0.4){
		ret_matrix[# 0, 0] = gp;
		ret_matrix[# 1, 0] = gp_axisrv;
		break;
	}
}

return ret_matrix;