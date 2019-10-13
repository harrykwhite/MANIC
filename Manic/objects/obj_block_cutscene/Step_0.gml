interact_active = false;

if (special == "bunkerenginedestroy"){
	if (global.level_current == Level.UndergroundBunker){
		if (global.game_objective_current == Objectives.DestroyProductionEngines){
			instance_destroy();
		}
	}
}

if (index == 52){
	interact = true;
	interact_special = "moveto";
}

if (!active){
	return;
}

if (instance_exists(obj_player)) && (global.cutscene_current == -1) && (!global.game_combat_in_hordechallenge){	
	if (place_meeting(x + 1, y + 1, obj_player)){
		if (time >= 30){
			if (special == "objectivecomplete"){
				if (!global.game_objective_complete){
					return;
				}
			}
			
			if (special == "requirebosskill"){
				if (global.boss_current != -1){
					return;
				}
			}
			
			if (interact){
				interact_active = true;
				
				if (interact_special == "moveto"){
					var boss = global.boss_current;
					
					if (boss != -1){
						if (boss != Boss.MotherRobot) && (boss != Boss.SniperRobot){
							interact_active = false;
							return;
						}
					}
					
					scr_ui_control_indicate(global.level_name[moveto_level]);
				}
				
				if (!scr_input_is_pressed(InputBinding.Interact) || !global.player_stamina_active){
					return;
				}
				
				scr_player_stamina_drain(4);
			}
			
			global.cutscene_current = index;
			
			if (special == "bunkerenginedestroy"){
				obj_controller_gameplay.cutscene_dialogue_bunker_engine_destroy = true;
			}
			
			if (special == "sicklelook"){
				obj_controller_ui.tutourial_stage_pickupmelee_cseen = true;
			}
			
			if (index == 40){
				obj_controller_gameplay.cutscene_look_x = look_x;
				obj_controller_gameplay.cutscene_look_y = look_y;
				obj_controller_gameplay.cutscene_look_time = look_time;
				obj_controller_gameplay.cutscene_look_object = look_object;
				obj_controller_gameplay.cutscene_look_prop = look_prop;
				obj_controller_gameplay.cutscene_look_boss = look_boss;
			}
			
			if (index == 52){
				obj_controller_gameplay.cutscene_moveto_dir = moveto_dir;
				obj_controller_gameplay.cutscene_moveto_room = moveto_room;
				obj_controller_gameplay.cutscene_moveto_level = moveto_level;
				obj_controller_gameplay.cutscene_moveto_type = moveto_type;
				obj_controller_gameplay.cutscene_moveto_instant = moveto_instant;
			}
			
			if (destroy_on_activate){
				instance_destroy();
			}
			
			if (deactivate_on_activate){
				active = false;
			}
		}
	}else{
		time ++;
	}
}