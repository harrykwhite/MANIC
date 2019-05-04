interact_active = false;

if (index == 52){
	interact = true;
	interact_special = "moveto";
}

if (!active){
	return;
}

if (instance_exists(obj_player)) && (global.cutscene_current == -1){	
	if (place_meeting(x + 1, y + 1, obj_player)){
		if (time >= 30){
			if (special == "requireclear"){
				if (!global.level_cleared[global.level_current]){
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
					
					scr_ui_control_indicate(global.level_name[moveto_level] + "");
				}
				
				if (!keyboard_check_pressed(obj_controller_all.key_interact)){
					return;
				}
			}
			
			global.cutscene_current = index;
			
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