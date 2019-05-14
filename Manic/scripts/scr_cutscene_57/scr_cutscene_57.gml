///scr_cutscene_56();
var index = 56;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	var xto = 516;
	var yto = 555;
	
	if (obj_controller_ui.game_opening_intro_alpha < 1){
		var dirto = point_direction(obj_controller_camera.x, obj_controller_camera.y, xto, yto);
		
		if (point_distance(obj_controller_camera.x, obj_controller_camera.y, xto, yto) > 10){
			if (cutscene_prologue_opening_camspeed < 2){
				cutscene_prologue_opening_camspeed += 0.5;
			}
		}else{
			cutscene_prologue_opening_camspeed = 0;
			
			if (global.cutscene_time[index] < 120){
				global.cutscene_time[index] ++;
			}else{
				global.cutscene_current = -1;
				global.cutscene_time[index] = 0;
				
				obj_controller_ui.area_next_fade = true;
				obj_controller_ui.area_next_alpha = 0;
				obj_controller_ui.area_next_alpha_speed = 0.01;
				obj_controller_ui.area_next_room = rm_level_1_00;
				return;
			}
		}
		
		obj_controller_camera.x += lengthdir_x(cutscene_prologue_opening_camspeed, dirto);
		obj_controller_camera.y += lengthdir_y(cutscene_prologue_opening_camspeed, dirto);
	}
	
	obj_controller_camera.autocontrol = false;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
	cutscene_prologue_opening_camspeed = 0;
	obj_controller_camera.autocontrol = true;
}