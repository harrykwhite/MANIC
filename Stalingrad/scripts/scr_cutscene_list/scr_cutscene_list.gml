for(var i = 0; i <= 52; i++){
	var asset = asset_get_index("scr_cutscene_" + string(i));
	
	if (script_exists(asset)){
		global.cutscene_script[i] = asset;
		global.cutscene_time[i] = 0;
		global.cutscene_camera_x[i] = 0;
		global.cutscene_camera_y[i] = 0;	
	}else{
		show_debug_message("Cutscene script " + string(i) + " does not exist");
	}
}

global.cutscene_current = -1;