///scr_cutscene_58();
var index = 58, x_to = 0, y_to = 0, special = "";

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	var inst = noone;
	var line, linefrom;
	
	switch(room){
		case rm_level_1_00:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_townperson_0);
			
			if (inst != noone){
				global.game_npc_townperson0_talked = true;
				
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
			}else{
				inst = instance_nearest(obj_player.x, obj_player.y, obj_townperson_1);
				
				if (inst != noone){
					global.game_npc_townperson1_talked = true;
					
					line[0] = "Hello?";
					linefrom[0] = obj_player;
			
					line[1] = "Hi. Did you also live here?";
					linefrom[1] = inst;
			
					line[2] = "No, I lived in a house up north.";
					linefrom[2] = obj_player;
			
					line[3] = "How about you?";
					linefrom[3] = obj_player;
			
					line[4] = "A friend of mine lived here, I came to see if he was okay.";
					linefrom[4] = inst;
			
					line[5] = "The town seems to be deserted, though.";
					linefrom[5] = inst;
			
					line[6] = "He may have escaped to the east. I believe a lot of them went that way.";
					linefrom[6] = obj_player;
			
					line[7] = "Did you see where the robots went?";
					linefrom[7] = obj_player;
			
					line[8] = "I remember seeing a large group of them approaching a farm to the south-east.";
					linefrom[8] = inst;
			
					line[9] = "Okay, thank you. I'll go and see what's going on.";
					linefrom[9] = obj_player;
					
					line[10] = "Thank you.";
					linefrom[10] = inst;
					
					if (point_distance(obj_player.x, obj_player.y, inst.x, inst.y) > 80){
						obj_player.move_x_to = inst.x;
						obj_player.move_y_to = inst.y;
						obj_player.move_extSpd = 1.25;
					}else{
						obj_player.move_x_to = -1;
						obj_player.move_y_to = -1;
						obj_player.move_extSpd = 0;
					}
				}
			}
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
		
		case rm_level_2_post_00:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_thescorched);
			
			line[0] = "This looks to be another one of their bases.";
			linefrom[0] = obj_player;
			
			line[1] = "I imagine that there'd be several around the country.";
			linefrom[1] = obj_player;
			
			line[2] = "We should try and clear them out.";
			linefrom[2] = inst;
			
			line[3] = "Definitely. Let's also try to find out more about them.";
			linefrom[3] = obj_player;
			
			line[4] = "In doing that we will be able to locate where the group first came from.";
			linefrom[4] = obj_player;
			break;
		
		case rm_level_3_01:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_companion_1);
			
			if (instance_exists(inst)){
				global.game_companion_grenadier_found = true;
				
				line[0] = "Hello?";
				linefrom[0] = obj_player;
			
				line[1] = "I'm in here to help shut down the base.";
				linefrom[1] = inst;
			
				line[2] = "I imagine that you two are doing the same?";
				linefrom[2] = inst;
			
				line[3] = "Yes, we will need some assistance however.";
				linefrom[3] = obj_player;
			
				line[4] = "I'll be able to help.";
				linefrom[4] = inst;
				
				line[5] = "Once I'm out of the bunker though, I can find my own way.";
				linefrom[5] = inst;
			}
			break;
		
		case rm_level_3_02:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_companion_1);
			
			if (instance_exists(inst)){
				inst.in_cutscene = true;
				special = "grenadierdepart";
				
				line[0] = "Alright, the base seems to be clear now.";
				linefrom[0] = obj_player;
			
				line[1] = "We can leave through the exit here.";
				linefrom[1] = obj_player;
			
				line[2] = "Thank you for the help!";
				linefrom[2] = obj_player;
			
				line[3] = "No problem.";
				linefrom[3] = inst;
				
				line[4] = "Good luck with your quest!";
				linefrom[4] = inst;
			}
			break;
		
		case rm_level_4_01:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_thedogkeeper);
			
			if (inst.dogs_downed){
				//line[0] = "";
				//linefrom[0] = inst;
			}else{
				line[0] = "Another fool, I see?";
				linefrom[0] = inst;
				
				line[1] = "Why do you keep fighting?";
				linefrom[1] = inst;
				
				line[2] = "You're not going to survive.";
				linefrom[2] = inst;
			}
			break;
		
		case rm_level_5_00:
			if (cutscene_dialogue_special == 0){
				inst = instance_nearest(obj_player.x, obj_player.y, obj_pawn_other_prisoner_0);
				
				if (instance_exists(inst)){
					line[0] = "Who are you?";
					linefrom[0] = inst;
					
					line[1] = "I'm here to get you out of here.";
					linefrom[1] = obj_player;
					
					line[2] = "What? What do you mean?";
					linefrom[2] = inst;
					
					line[3] = "Tell me, how did you get here?";
					linefrom[3] = obj_player;
					
					line[4] = "I was just at my home...";
					linefrom[4] = inst;
				
					line[5] = "I heard one of the windows being smashed open, and a horde of masked people running in.";
					linefrom[5] = inst;
					
					line[6] = "They knocked me onto the ground with a crowbar. Then everything went black...";
					linefrom[6] = inst;
				
					line[7] = "Okay, well you're alright now.";
					linefrom[7] = obj_player;
					
					line[8] = "The exit is down south.";
					linefrom[8] = obj_player;
				}
			}
			break;
		
		case rm_level_5_01:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_companion_2);
			
			if (instance_exists(inst)){
				global.game_companion_prisoner_found = true;
				
				line[0] = "...Hello?";
				linefrom[0] = inst;
			
				line[1] = "Hi. We're here to help you.";
				linefrom[1] = obj_companion_0;
			
				line[2] = "Okay...";
				linefrom[2] = inst;
			
				line[3] = "Are... are you trying to stop them? The robots?";
				linefrom[3] = inst;
				
				line[3] = "I can fight alongside you too.";
				linefrom[3] = inst;
				
				line[4] = "That'd be really useful.";
				linefrom[4] = obj_player;
				
				line[5] = "Thank you!";
				linefrom[5] = obj_companion_0;
			}
			break;
		
		case rm_level_5_04:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_companion_2);
			
			if (instance_exists(inst)){
				inst.in_cutscene = true;
				special = "prisonerdepart";
				
				line[0] = "Here's the exit, you can leave now.";
				linefrom[0] = obj_player;
			
				line[1] = "Thanks for joining us!";
				linefrom[1] = obj_companion_0;
			
				line[2] = "No problem. Thanks for getting me out of here.";
				linefrom[2] = inst;
				
				line[3] = "Good luck with everything else you are doing.";
				linefrom[3] = inst;
				
				line[3] = "Good bye.";
				linefrom[3] = inst;
			}
			break;
		
		case rm_level_6_pre_00:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_antagonist);
			
			if (inst == noone) || (obj_player.y < 200){
				if (obj_player.y < 200){
					inst = instance_nearest(obj_player.x, obj_player.y, obj_companion_0);
					inst.in_cutscene = true;
					
					if (cutscene_dialogue_line < 6){
						inst.depart_standaway = true;
						inst.depart = false;
					}
					
					special = "farmerdepart";
					
					line[0] = "I'm not too sure about this...";
					linefrom[0] = inst;
					
					line[1] = "About what?";
					linefrom[1] = obj_player;
					
					line[2] = "You need to learn to control yourself.";
					linefrom[2] = inst;
					
					line[3] = "You've completely lost track of the bigger picture here.";
					linefrom[3] = inst;
					
					line[4] = "This isn't about winning a fight, it's about saving others.";
					linefrom[4] = inst;
					
					line[5] = "I'm not going to help you any longer.";
					linefrom[5] = inst;
					
					line[6] = "I'm sorry.";
					linefrom[6] = inst;
					
					line[7] = "...";
					linefrom[7] = obj_player;
					
					line[8] = "...I won't need him.";
					linefrom[8] = obj_player;
				}
			}else{
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
				
					line[1] = "I am. Do you think you've got the strength to fight me?";
					linefrom[1] = obj_player;
				
					line[2] = "Oh, for sure.";
					linefrom[2] = inst;
				
					line[3] = "Let's see if you're as good as you think you are.";
					linefrom[3] = inst;
				}
			}
			break;
		
		case rm_level_6_00:
			var num = instance_number(obj_enemy_0);
			
			for(var i = 0; i < num; i ++){
				var this = instance_find(obj_enemy_0, i);
				
				if (this.type == Enemy0_Type.TrainBoss){
					inst = this;
					break;
				}
			}
			
			if (instance_exists(inst)){
				line[0] = "I was told that there was someone with you.";
				linefrom[0] = inst;
				
				line[1] = "Oh well...";
				linefrom[1] = inst;
			}
			break;
	}
	
	var instexists = inst != noone;
	
	obj_player.flashlight_move = false;
	obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, x_to, y_to);
	
	if (global.cutscene_time[index] < 25){
		global.cutscene_time[index] ++;
	}else{
		if (obj_controller_ui.dialogue_next) || (cutscene_dialogue_line == -1){
			if (instexists){
				if (special == "farmerdepart"){
					if (cutscene_dialogue_line >= 6){
						inst.depart_standaway = false;
						inst.depart = true;
					
						global.cutscene_time[index] = -120;
					}
				}
			
				if (special == "grenadierdepart"){
					if (cutscene_dialogue_line >= 3){
						inst.depart = true;
						global.cutscene_time[index] = -120;
					}
				}
				
				if (special == "prisonerdepart"){
					if (cutscene_dialogue_line >= 3){
						inst.depart = true;
						global.cutscene_time[index] = -120;
					}
				}
			}
			
			obj_controller_ui.dialogue_next = false;
			cutscene_dialogue_line ++;
			
			// End the dialogue sequence
			if (cutscene_dialogue_line >= array_length_1d(line)){
				global.cutscene_time[index] = 0;
				
				cutscene_dialogue_line = -1;
				cutscene_dialogue_special = -1;
				
				obj_controller_ui.dialogue_pause = false;
				obj_controller_ui.dialogue_time = 0;
				
				if (special == "farmerdepart") || (special == "grenadierdepart") || (special == "prisonerdepart"){
					global.cutscene_current = 52;
					global.cutscene_camera_x[52] = obj_player.x;
					global.cutscene_camera_y[52] = obj_player.y;
					
					switch(special){
						case "farmerdepart":
							scr_companion_remove(obj_companion_0);
							obj_controller_gameplay.cutscene_moveto_level = Level.TrainStation;
							obj_controller_gameplay.cutscene_moveto_room = global.level_room[Level.TrainStation];
							obj_controller_gameplay.cutscene_moveto_type = 0;
							obj_controller_gameplay.cutscene_moveto_dir = 1;
							obj_controller_gameplay.cutscene_moveto_instant = false;
							break;
						
						case "grenadierdepart":
							scr_companion_remove(obj_companion_1);
							obj_controller_gameplay.cutscene_moveto_level = Level.WinterTown;
							obj_controller_gameplay.cutscene_moveto_room = global.level_room[Level.WinterTown];
							obj_controller_gameplay.cutscene_moveto_type = 0;
							obj_controller_gameplay.cutscene_moveto_dir = 0;
							obj_controller_gameplay.cutscene_moveto_instant = false;
							break;
						
						case "prisonerdepart":
							scr_companion_remove(obj_companion_2);
							obj_controller_gameplay.cutscene_moveto_level = Level.TrainStation;
							obj_controller_gameplay.cutscene_moveto_room = rm_level_6_pre_00;
							obj_controller_gameplay.cutscene_moveto_type = 0;
							obj_controller_gameplay.cutscene_moveto_dir = 2;
							obj_controller_gameplay.cutscene_moveto_instant = false;
							break;
					}
				}else{
					global.cutscene_current = -1;
					inst.cutscene_prop = false;
				}
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
			
			global.game_in_dialogue = true;
		}
	}
	
	
	if (instexists){
		if (inst.x > obj_player.x){
			obj_player.image_xscale = 1;
		}else{
			obj_player.image_xscale = -1;
		}
		
		if (cutscene_dialogue_line != -1){
			// Update dialogue position
			obj_controller_ui.dialogue_x = linefrom[cutscene_dialogue_line].x;
			obj_controller_ui.dialogue_y = linefrom[cutscene_dialogue_line].y - 24;
			
			// Set the camera position based on speaker
			x_to = linefrom[cutscene_dialogue_line].x;
			y_to = linefrom[cutscene_dialogue_line].y - 8;
		}else{
			// Set the camera position to the next upcoming speaker
			x_to = linefrom[cutscene_dialogue_line + 1].x;
			y_to = linefrom[cutscene_dialogue_line + 1].y - 8;
		}
	}
	
	// Dialogue skipping
	if (obj_controller_ui.dialogue_skip >= obj_controller_ui.dialogue_skip_max){
		global.cutscene_current = -1;
		global.cutscene_time[index] = 0;
		cutscene_dialogue_line = -1;
		cutscene_dialogue_special = -1;
		
		if (instexists){
			inst.cutscene_prop = false;
		}
		
		obj_controller_ui.dialogue_time = 0;
		
		if (special == "farmerdepart"){
			scr_companion_remove(obj_companion_0);
			global.cutscene_current = 52;
			global.cutscene_camera_x[52] = obj_player.x;
			global.cutscene_camera_y[52] = obj_player.y;
			
			obj_controller_gameplay.cutscene_moveto_level = 6;
			obj_controller_gameplay.cutscene_moveto_room = rm_level_6_00;
			obj_controller_gameplay.cutscene_moveto_type = 0;
			obj_controller_gameplay.cutscene_moveto_dir = 1;
			obj_controller_gameplay.cutscene_moveto_instant = false;
		}
		return;
	}
	
	// Set camera position
	global.cutscene_camera_x[index] = x_to;
	global.cutscene_camera_y[index] = y_to;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
	cutscene_dialogue_line = -1;
	cutscene_dialogue_special = -1;
}