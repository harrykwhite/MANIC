if (room != rm_title_0){
	instance_destroy();
}

if (fade){
	if (fade_alpha < 1){
		fade_alpha += fade_speed;
	}else{
		room_goto(fade_goto);
	}
}else{
	if (fade_opening){
		if (fade_alpha > 0){
			fade_alpha -= 0.035;
		}else{
			fade_alpha = 0;
			fade_opening = false;
		}
		
		fade_alpha = clamp(fade_alpha, 0, 1);
		exit;
	}
	
	if (STATE == GameState.Developer){
		if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)){
	
			if (selected > 0){
				selected--;
			}else{
				selected = smax + 1;
			}
		}

		if (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down)){
	
			if (selected < smax + 1){
				selected ++;
			}else{
				selected = 0;
			}
		}

		if (keyboard_check_pressed(vk_enter)){
			fade = true;
			fade_speed = 0.05;
			
			if (selected != smax + 1){
				fade_goto = global.level_room[selected];
			}else{
				fade_goto = rm_level_1_00;
				fade_speed = 0.01;
				global.game_playthrough = true;
			}
		}
	
	}else{
		
		if (keyboard_check_pressed(vk_enter)){
			fade = true;
			fade_speed = 0.01;
			fade_goto = global.level_room[0];
			global.game_playthrough = true;
		}
	}
}