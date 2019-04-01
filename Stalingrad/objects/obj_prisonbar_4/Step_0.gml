if (global.game_pause){
	image_speed = 0;
	exit;
}

if (open){
	sprite_index = spr_prisonbar_4_open;
	if (open_animation){
		image_speed = 1;
		if (image_index == image_number - 1){
			open_animation = false;
		}
	}else{
		image_speed = 0;
		image_index = image_number - 1;
	}
}else{
	sprite_index = spr_prisonbar_4;
	if (global.cutscene_current == -1){
		if (place_meeting(x, y + 15, obj_player)){
			scr_ui_control_indicate("Unlock [E]");
			sprite_index = spr_prisonbar_4_interact;
		
			if (keyboard_check_pressed(ord("E"))){
				open = true;
				scr_effect_screenshake(1);
				scr_sound_play(snd_object_prisondoor_open_0, false, 0.9, 1.1);
				
				if (instance_exists(inst_40C9D2CD) && (id == inst_3ABFBF5A)) {
					inst_40C9D2CD.domove = true;
				}
				
				if (instance_exists(inst_6BFE333C) && (id == inst_1F5AF17B)){
					inst_6BFE333C.domove = true;
				}
				
				if (instance_exists(inst_1E5C6C8B) && (id == inst_21FBADF9)){
					inst_1E5C6C8B.domove = true;
				}
				
				if (instance_exists(inst_662A451E) && (id == inst_30386B85)){
					inst_662A451E.domove = true;
				}
				
				if (instance_exists(inst_333428A9) && (id == inst_76845CC3)){
					inst_333428A9.domove = true;
				}
				
				if (instance_exists(inst_69E84805) && (id == inst_6DA3E3F2)){
					inst_69E84805.domove = true;
				}
				
				if (instance_exists(inst_2C069A40) && (id == inst_720E14C7)){
					inst_2C069A40.domove = true;
				}
			}
		}
	}
}