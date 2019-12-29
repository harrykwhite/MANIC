if (object_index != obj_titlescreen_main){
	show_debug_message("Trying to call scr_clear_save_data() from an object outside of obj_titlescreen_main.");
	return;
}

if (file_exists("save.ini")){
	file_delete("save.ini");
	obj_controller_all.indicate_text = "Save data has been reset";
}else{
	obj_controller_all.indicate_text = "No save data was found";
}

scr_save_game_reader();

if (!isteaser){
	option[0] = "New Game";
	option_locked[1] = true;

	if (global.game_save_started){
		option[0] = "Continue Game";
	}

	if (global.game_levelselect_unlocked) || (devmode){
		option_locked[1] = false;
	}
}

with(obj_controller_all){
	indicate_text_time = indicate_text_time_max;
	indicate_text_alpha = 1;
}