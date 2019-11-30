reset_text_scale = 1;
return_text_scale = 1;

for(var i = 0; i < 8; i ++){
	if (i < option_max){
		option_scale[i] = 1;
	}
	
	if (i < option_levelselect_scale){
		option_levelselect_scale[i] = 1;
	}
	
	if (i < option_setting_max){
		option_setting_scale[i] = 1;
	}
	
	if (i < option_setting_gameplay_max){
		option_setting_gameplay_scale[i] = 1;
	}
	
	if (i < option_setting_display_max){
		option_setting_display_scale[i] = 1;
	}
	
	if (i < option_setting_audio_max){
		option_setting_audio_scale[i] = 1;
	}
}