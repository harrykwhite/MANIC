if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	
	if (type != 0){
		switch(type){
			case 1:
				if ((sprite_index != spr_player_child_1_idle_0) or (sprite_index != spr_player_child_1_walk_0)){
					sprite_index = spr_player_child_1_idle_0;
				}
				break;
		}
	}
	
	exit;
}

scr_child_behaviour_0();