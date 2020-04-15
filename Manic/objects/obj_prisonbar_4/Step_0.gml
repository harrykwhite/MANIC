if (global.game_pause){
	image_speed = 0;
	return;
}

if (open){
	if (electronic){
		sprite_index = spr_prisonbar_5_open;
	}else{
		sprite_index = spr_prisonbar_4_open;
	}
	
	if (open_animation){
		image_speed = 1;
	}else{
		image_speed = 0;
		image_index = image_number - 1;
	}
}else{
	if (electronic){
		sprite_index = spr_prisonbar_5;
	}else{
		sprite_index = spr_prisonbar_4;
	}
	
	if (global.cutscene_current == -1) && (!locked) && (!electronic){
		if (place_meeting(x, y + 15, obj_player)){
			scr_ui_control_indicate("Unlock");
			sprite_index = spr_prisonbar_4_interact;
			
			if (scr_input_is_pressed(InputBinding.Interact) && global.player_stamina_active){
				scr_player_stamina_drain(4);
				scr_sound_play(snd_object_prisondoor_open_0, false, 0.8, 1.2);
				
				var released = false;
				open = true;
				
				if (instance_exists(inst_40C9D2CD) && (id == inst_3ABFBF5A)){
					obj_controller_gameplay.cutscene_dialogue_special = 0;
					inst_40C9D2CD.domove = true;
					inst_40C9D2CD.talk = false;
					global.game_npc_prisoner0_left = true;
					global.cutscene_current = 58;
					released = true;
				}
				
				if (instance_exists(inst_6BFE333C) && (id == inst_1F5AF17B)){
					inst_6BFE333C.domove = true;
					inst_6BFE333C.talk = true;
					global.game_npc_prisoner1_left = true;
					released = true;
				}
				
				if (instance_exists(inst_1E5C6C8B) && (id == inst_21FBADF9)){
					inst_1E5C6C8B.domove = true;
					inst_1E5C6C8B.talk = true;
					global.game_npc_prisoner2_left = true;
					released = true;
				}
				
				if (instance_exists(inst_662A451E) && (id == inst_30386B85)){
					inst_662A451E.domove = true;
					inst_662A451E.talk = true;
					global.game_npc_prisoner3_left = true;
					released = true;
				}
				
				if (instance_exists(inst_333428A9) && (id == inst_76845CC3)){
					inst_333428A9.domove = true;
					inst_333428A9.talk = true;
					global.game_npc_prisoner4_left = true;
					released = true;
				}
				
				if (instance_exists(inst_69E84805) && (id == inst_6DA3E3F2)){
					inst_69E84805.domove = true;
					inst_69E84805.talk = true;
					global.game_npc_prisoner5_left = true;
					released = true;
				}
				
				if (instance_exists(inst_2C069A40) && (id == inst_720E14C7)){
					inst_2C069A40.domove = true;
					inst_2C069A40.talk = true;
					global.game_npc_prisoner6_left = true;
					released = true;
				}
				
				if (instance_exists(inst_2D307562) && (id == inst_32F7CFBC)){
					inst_2D307562.domove = true;
					inst_2D307562.talk = true;
					global.game_npc_prisoner7_left = true;
					released = true;
				}
				
				if (instance_exists(inst_585D174B) && (id == inst_10B6E9CE)){
					inst_585D174B.domove = true;
					inst_585D174B.talk = true;
					global.game_npc_prisoner8_left = true;
					released = true;
				}
				
				if (released){
					if (global.level_current == Level.HumanPrison){
						scr_objective_update_counter();
					}
				}
			}
		}
	}
}