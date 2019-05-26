///scr_cutscene_58();
var index = 58, x_to = 592, y_to = 328;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	var inst = noone;
	var line, linefrom;
	
	switch(room){
		case rm_level_1_00:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_townperson_0);
			
			line[0] = "Hello? Are you okay?";
			linefrom[0] = obj_player;
			
			line[1] = "Yes... I'm alright...";
			linefrom[1] = inst;
			
			line[2] = "Are you able to tell me what has happened?";
			linefrom[2] = obj_player;
			
			line[3] = "Large groups of them ran into the town...";
			linefrom[3] = inst;
			
			line[4] = "They murdered our people... they ravaged all of our houses.";
			linefrom[4] = inst;
			
			line[5] = "I'm not even sure how long I've been waiting here...";
			linefrom[5] = inst;
			
			line[6] = "It's okay, you'll be fine.";
			linefrom[6] = obj_player;
			
			line[7] = "I'm going to clear them out of the town.";
			linefrom[7] = obj_player;
			
			line[8] = "Once it's safe, you can leave down south.";
			linefrom[8] = obj_player;
			
			line[9] = "Alright, thank you...";
			linefrom[9] = inst;
			break;
		
		case rm_level_2_00:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_companion_0);
			
			line[0] = "Have you seen what's happening? The robots?";
			linefrom[0] = inst;
			
			line[1] = "I have. I'm trying to find out more about it.";
			linefrom[1] = obj_player;
			
			line[2] = "Did they raid this place, too?";
			linefrom[2] = obj_player;
			
			line[3] = "Not yet, I've been trying to fight them off.";
			linefrom[3] = inst;
			
			line[4] = "However I did see a large group of them to the south.";
			linefrom[4] = inst;
			
			line[5] = "Alright. I'm not going to let them take any more people.";
			linefrom[5] = obj_player;
			
			line[6] = "I'll follow your lead.";
			linefrom[6] = inst;
			break;
		
		case rm_level_2_02:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_thescorched);
			
			if (inst.health_current <= inst.health_max / 2){
				line[0] = "Such hostility from a man of peace?";
				linefrom[0] = inst;
				
				line[1] = "Let's see how you go against this!";
				linefrom[1] = inst;
			}else{
				line[0] = "You... you seem familiar.";
				linefrom[0] = inst;
				
				line[1] = "You're from the house up north?";
				linefrom[1] = inst;
				
				line[2] = "I see you came back to avenge your family.";
				linefrom[2] = inst;
				
				line[3] = "Yes. You aren't getting out of this alive.";
				linefrom[3] = obj_player;
				
				line[4] = "Oh, we'll see!";
				linefrom[4] = inst;
			}
			break;
		
		case rm_level_5_00:
			if (cutscene_dialogue_special == 0){
				inst = inst_40C9D2CD;
				
				if (instance_exists(inst)){
					line[0] = "Who are you?";
					linefrom[0] = inst;
					
					line[1] = "I'm here to get you out of here.";
					linefrom[1] = obj_player;
					
					line[2] = "What? What do you mean?";
					linefrom[2] = inst;
					
					line[3] = "Just tell me, how did you get here?";
					linefrom[3] = obj_player;
					
					line[4] = "I was just at my home..";
					linefrom[4] = inst;
				
					line[5] = "And a large group of masked people broke in.";
					linefrom[5] = inst;
					
					line[6] = "I remember being knocked onto the ground. I'm not sure what happened after that...";
					linefrom[6] = inst;
				
					line[7] = "Okay, well you're alright now.";
					linefrom[7] = obj_player;
					
					line[8] = "The exit is down south.";
					linefrom[8] = obj_player;
				}
			}
			break;
		
		case rm_level_6_pre_00:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_antagonist);
			
			if (inst.near_dead){
				line[0] = "I may have underestimated you...";
				linefrom[0] = inst;
				
				line[1] = "Meet me at the city if you truly think you're worthy.";
				linefrom[1] = inst;
				
				line[2] = "There we will fight again.";
				linefrom[2] = inst;
			}else{
				line[0] = "So, you're finally here?";
				linefrom[0] = inst;
				
				line[1] = "I am. Do you think you've got the nerve to harm me?";
				linefrom[1] = obj_player;
				
				line[2] = "Of course!";
				linefrom[2] = inst;
				
				line[3] = "Let's see if you're as good as you think you are.";
				linefrom[3] = inst;
			}
			break;
	}
	
	var instexists = inst != noone;
	
	obj_player.flashlight_move = false;
	obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, x_to, y_to);
	
	if (global.cutscene_time[index] < 25){
		global.cutscene_time[index] ++;
	}else{
		if (obj_controller_ui.dialogue_next) || (cutscene_dialogue_line == 0){
			obj_controller_ui.dialogue_next = false;
		
			// End the dialogue sequence
			if (cutscene_dialogue_line >= array_length_1d(line)){
				global.cutscene_current = -1;
				global.cutscene_time[index] = 0;
				
				cutscene_dialogue_line = 0;
				cutscene_dialogue_special = -1;
				
				obj_controller_ui.dialogue_pause = false;
				obj_controller_ui.dialogue_time = 0;
			
				inst.cutscene_prop = false;
				return;
			}
		
			// Set the new line of dialogue
			obj_controller_ui.dialogue = line[cutscene_dialogue_line];
			obj_controller_ui.dialogue_time = 10;
			obj_controller_ui.dialogue_pause = true;
			obj_controller_ui.dialogue_count = 0;
		
			// Set the dialogue position based on the speaking character
			if (instexists){
				obj_controller_ui.dialogue_x = linefrom[cutscene_dialogue_line].x;
				obj_controller_ui.dialogue_y = linefrom[cutscene_dialogue_line].y - 24;
			}
		
			cutscene_dialogue_line ++;
			
			global.game_in_dialogue = true;
		}
	}
	
	
	if (instexists){
		if (inst.x > obj_player.x){
			obj_player.image_xscale = 1;
		}else{
			obj_player.image_xscale = -1;
		}
		
		// Set the camera position based on speaker
		if (cutscene_dialogue_line - 1 >= 0){
			x_to = linefrom[cutscene_dialogue_line - 1].x;
			y_to = linefrom[cutscene_dialogue_line - 1].y - 8;
		}else{
			x_to = linefrom[cutscene_dialogue_line].x;
			y_to = linefrom[cutscene_dialogue_line].y - 8;
		}
	}
	
	// Dialogue skipping
	if (obj_controller_ui.dialogue_skip >= obj_controller_ui.dialogue_skip_max){
		global.cutscene_current = -1;
		global.cutscene_time[index] = 0;
		cutscene_dialogue_line = 0;
		cutscene_dialogue_special = -1;
		
		if (instexists){
			inst.cutscene_prop = false;
		}
		
		obj_controller_ui.dialogue_time = 0;
		return;
	}
	
	// Set camera position
	global.cutscene_camera_x[index] = x_to;
	global.cutscene_camera_y[index] = y_to;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
	cutscene_dialogue_line = 0;
	cutscene_dialogue_special = -1;
}