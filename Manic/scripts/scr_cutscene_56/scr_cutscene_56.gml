///scr_cutscene_56();
var index = 56;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	if (obj_controller_ui.game_opening_intro_alpha < 1){
		if (abs(obj_controller_camera.x - obj_player.x) > 10){
			if (cutscene_prologue_opening_camspeed < 0.8){
				cutscene_prologue_opening_camspeed += 0.025;
			}
		}else{
			if (cutscene_prologue_opening_camspeed > 0){
				cutscene_prologue_opening_camspeed -= 0.025;
			}
			
			if (global.cutscene_time[index] < 140){
				global.cutscene_time[index] ++;
			}else{
				global.cutscene_current = -1;
				global.cutscene_time[index] = 0;
				cutscene_prologue_opening_camspeed = 0;
				obj_controller_camera.autocontrol = true;
				return;
			}
		}
		
		obj_controller_camera.x -= cutscene_prologue_opening_camspeed;
		obj_controller_camera.y = obj_player.y + 16;
	}
	
	obj_controller_camera.autocontrol = false;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
	cutscene_prologue_opening_camspeed = 0;
	obj_controller_camera.autocontrol = true;
}