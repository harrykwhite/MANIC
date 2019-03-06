var levelobj = scr_get_level_object();
interact_active = false;

if (moveto_dir != -1){
	interact = true;
	interact_special = "moveto";
}

if (special == "levelfourbossrestart"){
	if (!obj_controller_levelfour.dogkeeper_failed){
		exit;
	}
}

if (!active){
	exit;
}

if (instance_exists(global.player)) && (global.cutscene_current == -1){	
	if (place_meeting(x + 1, y + 1, global.player)){
		if (time >= 30){
			if (interact){
				interact_active = true;
				if (interact_special == "moveto"){
					scr_ui_control_indicate(global.level_name[moveto_level] + " [E]")
				}
				
				if (!keyboard_check_pressed(ord("E"))){
					exit;
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