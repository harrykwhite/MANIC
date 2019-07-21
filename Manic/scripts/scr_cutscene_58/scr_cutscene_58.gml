///scr_cutscene_58();
var index = 58, x_to = 0, y_to = 0, special = "", is_last_interaction = false;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

/*

Main character:
starts as a strong, "family-centered" character who is determined to help stop the issue and save others. Delves into madness
and becomes obsessed with violence and revenge.

- Lived as a farmer
- Small family, two children
- Moved around a lot as a child and didn't have a strong family connection <- determined to not have that again
- 

Farmer:
Self-concious and genuine person who is interested in helping others but notices that his actions have become wrong and
especially the actions of the main character

- Also lived as a farmer like the player
- Lived mostly isolated, introverted
- A quiet but assistful and motivated person


*/

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
				
				line[2] = "Could you tell me what has happened?";
				linefrom[2] = obj_player;
				
				line[3] = "Large groups of them ran into the town...";
				linefrom[3] = inst;
				
				line[4] = "They murdered our people... they ravaged all of our houses.";
				linefrom[4] = inst;
				
				line[5] = "I'm not even sure how long I've been waiting here...";
				linefrom[5] = inst;
				
				line[6] = "I understand. For now just stay in here a little longer where it's safe.";
				linefrom[6] = obj_player;
				
				line[7] = "I'm currently trying to clear them all out of the town.";
				linefrom[7] = obj_player;
				
				line[8] = "Once they're gone, I'd suggest going to the south and finding somewhere to stay.";
				linefrom[8] = obj_player;
				
				line[9] = "Okay thank you, I'll do that...";
				linefrom[9] = inst;
				
				line[10] = "No problem, take care of yourself.";
				linefrom[10] = obj_player;
			}else{
				inst = instance_nearest(obj_player.x, obj_player.y, obj_townperson_1);
				
				if (inst != noone){
					global.game_npc_townperson1_talked = true;
					
					line[0] = "Hello?";
					linefrom[0] = obj_player;
			
					line[1] = "Hi. Were you one of the citizens here?";
					linefrom[1] = inst;
			
					line[2] = "No, I'm from a farmhouse up north.";
					linefrom[2] = obj_player;
			
					line[3] = "How about you?";
					linefrom[3] = obj_player;
			
					line[4] = "A friend of mine had been staying here for a couple nights.";
					linefrom[4] = inst;
					
					line[5] = "When I heard what had happened I immediately came over here to see if he was okay.";
					linefrom[5] = inst;
					
					line[6] = "The area seems to be deserted, though.";
					linefrom[6] = inst;
					
					line[7] = "He may have escaped to the south. That'd most likely be the safest option, as I doubt those areas have been taken over yet.";
					linefrom[7] = obj_player;
					
					line[8] = "If I were you, I'd go down there first. They'll need somewhere to stay in the meantime. Somewhere safe.";
					linefrom[8] = obj_player;
					
					line[9] = "As you were coming up here, did you locate where the robots were going to?";
					linefrom[9] = obj_player;
			
					line[10] = "Well, I do recall seeing a large group of them approaching a farm to the south-east. They appeared to be lead by some tall, burning figure.";
					linefrom[10] = inst;
			
					line[11] = "Alright, that'll be where I'm heading next.";
					linefrom[11] = obj_player;
					
					line[12] = "I appreciate the dedication. Hopefully this will all be over soon.";
					linefrom[12] = inst;
					
					line[13] = "Keep up the good work by the way, the world needs more people like you.";
					linefrom[13] = inst;
					
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
			
			line[1] = "I have, yes. A person from the town up north said that he saw a group of them approaching this farm?";
			linefrom[1] = obj_player;
			
			line[2] = "Well, he'd be correct. I've been trying to fight them off, but they only seem to be increasing in numbers.";
			linefrom[2] = inst;
			
			line[3] = "I see. How about we make a team? You and I? This army isn't going to fight itself.";
			linefrom[3] = obj_player;
			
			line[4] = "I will gladly join you.";
			linefrom[4] = inst;
			
			line[5] = "Alright, sounds great. The person I was speaking to earlier, he recounts seeing some kind of... burning figure?";
			linefrom[5] = obj_player;
			
			line[6] = "I may know what he was talking about. I didn't see it all, but there was someone like that heading towards the south.";
			linefrom[6] = inst;
			
			line[7] = "Let's go there first, to see what's going on.";
			linefrom[7] = inst;
			
			line[8] = "Great, take the lead.";
			linefrom[8] = inst;
			break;
		
		case rm_level_2_03:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_thescorched);
			
			if (global.game_boss_thescorched_talked){
				global.cutscene_current = 40;
				global.cutscene_time[index] = 0;
				
				with(obj_controller_gameplay){
					cutscene_look_x = inst.x;
					cutscene_look_y = inst.y;
					cutscene_look_time = 70;
					cutscene_look_object = inst;
					cutscene_look_prop = true;
					cutscene_look_boss = Boss.TheScorched;
				}
				
				return;
			}
			
			if (inst.health_current <= inst.health_max / 2){
				is_last_interaction = true;
				
				line[0] = "Such hostility from a man of peace?";
				linefrom[0] = inst;
				
				line[1] = "Let's see how you go against this!";
				linefrom[1] = inst;
			}else{
				line[0] = "You... you seem familiar.";
				linefrom[0] = inst;
				
				line[1] = "Weren't you the one from the house up north?";
				linefrom[1] = inst;
				
				line[2] = "I see you came back to avenge your family.";
				linefrom[2] = inst;
				
				line[3] = "You're going to pay for what you've done... not just to me but to everyone else.";
				linefrom[3] = obj_player;
				
				line[4] = "Oh, is that so? Okay then, let's put that to the test!";
				linefrom[4] = inst;
			}
			break;
		
		case rm_level_2_post_00:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_companion_0);
			
			if (!instance_exists(inst)){
				global.cutscene_time[index] = 0;
				global.cutscene_current = -1;
				return;
			}
			
			global.game_companion_farmer_level2post_talked_1 = true;
			
			line[0] = "This looks to be one of their bases. I imagine that there'd be several around the country.";
			linefrom[0] = obj_player;
			
			line[1] = "Perhaps we should try to clear each of them out, there may even be some people inside.";
			linefrom[1] = inst;
			
			line[2] = "They may even have some information reguarding where where the group originated from?";
			linefrom[2] = inst;
			
			line[3] = "Yes, absolutely. Let's go.";
			linefrom[3] = obj_player;
			break;
		
		case rm_level_3_01:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_companion_1);
			
			if (instance_exists(inst)){
				global.game_companion_grenadier_found = true;
				
				line[0] = "Hello?";
				linefrom[0] = obj_player;
			
				line[1] = "I'm in here to help shut down the base.";
				linefrom[1] = inst;
			
				line[2] = "I'd imagine that you two are doing the same?";
				linefrom[2] = inst;
			
				line[3] = "That's correct. We'll need some assistance, though.";
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
				
				line[0] = "Alright, I believe we've cleared out the entire base.";
				linefrom[0] = obj_player;
				
				line[1] = "Thanks for everything! You can leave through the exit here.";
				linefrom[1] = obj_player;
				
				line[2] = "Yeah! We appreciate for the help.";
				linefrom[2] = obj_companion_0;
				
				line[3] = "No problem.";
				linefrom[3] = inst;
				
				line[4] = "You're aiming to shut them down, aren't you?";
				linefrom[4] = inst;
				
				line[5] = "Yes, that's the plan. We need to put an end to their destruction.";
				linefrom[5] = obj_player;
				
				line[6] = "Those are definitely some good intentions.";
				linefrom[6] = inst;
				
				line[7] = "Well, best of luck!";
				linefrom[7] = inst;
			}else{
				global.cutscene_current = 52;
				global.cutscene_time[index] = 0;
				
				with(obj_controller_gameplay){
					cutscene_moveto_dir = 0;
					cutscene_moveto_level = Level.WinterTown;
					cutscene_moveto_room = rm_level_4_00;
					cutscene_moveto_type = 0;
					cutscene_moveto_instant = false;
				}
				
				return;
			}
			break;
		
		case rm_level_4_02:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_thedogkeeper);
			
			if (global.game_boss_thedogkeeper_talked){
				global.cutscene_current = 40;
				global.cutscene_time[index] = 0;
				
				with(obj_controller_gameplay){
					cutscene_look_x = inst.x;
					cutscene_look_y = inst.y;
					cutscene_look_time = 70;
					cutscene_look_object = inst;
					cutscene_look_prop = true;
					cutscene_look_boss = Boss.TheDogkeeper;
				}
				
				return;
			}
			
			is_last_interaction = true;
			
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
				
				line[3] = "I want to see you suffer, like how your people made me suffer.";
				linefrom[3] = obj_player;
				
				line[4] = "I killed one of the other leaders. It seems you'll be next.";
				linefrom[4] = obj_player;
				
				line[5] = "Oh, him? He was just a coward. We didn't need that uselses imbecile.";
				linefrom[5] = inst;
				
				line[6] = "You have no idea what's coming for you...";
				linefrom[6] = inst;
				
				line[7] = "Anyways, I appreciate the enthusiasm.";
				linefrom[7] = inst;
				
				line[8] = "Let it proceed.";
				linefrom[8] = inst;
			}
			break;
		
		case rm_level_5_00:
			if (cutscene_dialogue_special == 0){
				inst = instance_nearest(obj_player.x, obj_player.y, obj_pawn_other_prisoner_0);
				
				if (instance_exists(inst)){
					line[0] = "Who are you?";
					linefrom[0] = inst;
					
					line[1] = "I'm here to get you out of this place.";
					linefrom[1] = obj_player;
					
					line[2] = "What? What do you mean?";
					linefrom[2] = inst;
					
					line[3] = "Just tell me, how did you get here?";
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
				
				line[0] = "...";
				linefrom[0] = inst;
				
				line[1] = "Hi! We're here to get you out of here.";
				linefrom[1] = obj_companion_0;
				
				line[2] = "Okay...";
				linefrom[2] = inst;
				
				line[3] = "Are... are you trying to stop them? The robots?";
				linefrom[3] = inst;
				
				line[4] = "I can fight alongside you... if you need...";
				linefrom[4] = inst;
				
				line[5] = "That'd be very useful.";
				linefrom[5] = obj_player;
				
				line[6] = "We'd love that! Thank you.";
				linefrom[6] = obj_companion_0;
			}
			break;
		
		case rm_level_5_04:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_companion_2);
			
			if (instance_exists(inst)){
				inst.in_cutscene = true;
				special = "prisonerdepart";
				
				line[0] = "Here's the exit, you can leave now.";
				linefrom[0] = obj_player;
				
				line[1] = "Thanks for the assistance! It would have been really difficult without you.";
				linefrom[1] = obj_companion_0;
				
				line[2] = "That's okay... thanks for getting me out of here.";
				linefrom[2] = inst;
				
				line[3] = "...I appreciate what you're doing.";
				linefrom[3] = inst;
				
				line[4] = "I'll see you around... I guess?";
				linefrom[4] = inst;
			}else{
				global.cutscene_current = 52;
				global.cutscene_time[index] = 0;
				
				with(obj_controller_gameplay){
					cutscene_moveto_dir = 3;
					cutscene_moveto_level = Level.TrainStation;
					cutscene_moveto_room = rm_level_6_pre_00;
					cutscene_moveto_type = 0;
					cutscene_moveto_instant = false;
				}
				
				return;
			}
			
			break;
		
		case rm_level_6_pre_00:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_antagonist);
			
			if (cutscene_dialogue_special == 1){
				if (cutscene_dialogue_line >= 3){
					inst = obj_companion_0;
				}
			}
			
			if (inst != noone) && (instance_exists(inst)){
				if (inst.object_index == obj_antagonist){
					if (inst.near_dead){
						cutscene_dialogue_special = 1;
					}
				}
			}else{
				x_to = obj_player.x;
				y_to = obj_player.y - 8;
			}
			
			if (cutscene_dialogue_special == 1){
				special = "farmerdepart";
				
				line[0] = "We may have underestimated you...";
				linefrom[0] = inst;
				
				line[1] = "Meet me at the city if you truly think you're worthy.";
				linefrom[1] = inst;
				
				line[2] = "There we will fight again.";
				linefrom[2] = inst;
				
				line[3] = "I'm not too sure about this...";
				linefrom[3] = obj_companion_0;
				
				line[4] = "About what?";
				linefrom[4] = obj_player;
				
				line[5] = "You need to learn to control yourself.";
				linefrom[5] = obj_companion_0;
					
				line[6] = "You've completely lost track of the bigger picture here.";
				linefrom[6] = obj_companion_0;
				
				line[7] = "This isn't about winning a fight, it's about saving others. This mission isn't about you.";
				linefrom[7] = obj_companion_0;
				
				line[8] = "I can't keep following your corrupted lead... I... I'm not going to help you any longer.";
				linefrom[8] = obj_companion_0;
				
				line[9] = "I'm sorry...";
				linefrom[9] = obj_companion_0;
				
				line[10] = "...";
				linefrom[10] = obj_player;
				
				line[11] = "...I won't need him.";
				linefrom[11] = obj_player;
			}else{
				if (global.game_boss_firstantag_talked){
					global.cutscene_current = 40;
					global.cutscene_time[index] = 0;
					
					with(obj_controller_gameplay){
						cutscene_look_x = inst.x;
						cutscene_look_y = inst.y;
						cutscene_look_time = 70;
						cutscene_look_object = inst;
						cutscene_look_prop = true;
						cutscene_look_boss = Boss.Antagonist;
					}
					
					return;
				}
				
				line[0] = "So, you're finally here?";
				linefrom[0] = inst;
				
				line[1] = "I am. Do you think you've got the strength to fight me?";
				linefrom[1] = obj_player;
				
				line[2] = "Oh, for sure.";
				linefrom[2] = inst;
				
				line[3] = "Let's see if you're as good as you think you are!";
				linefrom[3] = inst;
			}
			break;
		
		case rm_level_6_00:
			var num = instance_number(obj_enemy_0);
			
			for(var i = 0; i < num; i ++){
				var this = instance_find(obj_enemy_0, i);
				
				if (this.type == Enemy0_Type.TrainBoss){
					is_last_interaction = true;
					inst = this;
					break;
				}
			}
			
			if (instance_exists(inst)){
				if (global.game_boss_trainhorde_talked){
					global.cutscene_current = 40;
					global.cutscene_time[index] = 0;
				
					with(obj_controller_gameplay){
						cutscene_look_x = inst.x;
						cutscene_look_y = inst.y;
						cutscene_look_time = 70;
						cutscene_look_object = inst;
						cutscene_look_prop = true;
						cutscene_look_boss = Boss.TrainBoss;
					}
				
					return;
				}
				
				line[0] = "They told me that there was a farmer with you.";
				linefrom[0] = inst;
				
				line[1] = "I suppose not... Oh well...";
				linefrom[1] = inst;
				
				line[2] = "I guess you'll have to die alone.";
				linefrom[2] = inst;
			}
			break;
	}
	
	var instexists = instance_exists(inst);
	
	if (global.cutscene_time[index] < 25){
		global.cutscene_time[index] ++;
	}else{
		if (obj_controller_ui.dialogue_next) || (cutscene_dialogue_line == -1){
			if (instexists){
				if (special == "farmerdepart"){
					switch(cutscene_dialogue_line){
						case 2:
							inst.walk_off = true;
							break;
						
						case 3:
							obj_companion_0.depart_standaway = true;
							obj_companion_0.depart = false;
							break;
						
						case 8:
							obj_companion_0.depart_standaway = false;
							obj_companion_0.depart = true;
							break;
					}
				}
				
				//if (special == "grenadierdepart"){
				//	if (cutscene_dialogue_line >= 3){
				//		inst.depart = true;
				//		global.cutscene_time[index] = -120;
				//	}
				//}
				
				//if (special == "prisonerdepart"){
				//	if (cutscene_dialogue_line >= 3){
				//		inst.depart = true;
				//		global.cutscene_time[index] = -120;
				//	}
				//}
			}
			
			obj_controller_ui.dialogue_next = false;
			cutscene_dialogue_line ++;
			
			// End the dialogue sequence
			if (cutscene_dialogue_line >= array_length_1d(line)){
				switch(inst){
					case obj_thescorched:
						if (is_last_interaction){
							global.game_boss_thescorched_talked = true;
						}
						break;
					
					case obj_thedogkeeper:
						global.game_boss_thedogkeeper_talked = true;
						break;
					
					case obj_companion_0:
						if (is_last_interaction) && (room == rm_level_6_pre_00){
							global.game_boss_firstantag_talked = true;
						}
						break;
					
					case obj_enemy_0:
						if (inst.type == Enemy0_Type.TrainBoss) && (is_last_interaction){
							global.game_boss_trainhorde_talked = true;
						}
						break;
				}
				
				global.cutscene_time[index] = 0;
				
				cutscene_dialogue_line = -1;
				cutscene_dialogue_special = -1;
				
				obj_player.move_x_to = -1;
				obj_player.move_y_to = -1;
				obj_player.move_extSpd = 0;
				
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
					inst.in_cutscene = false;
				}
				return;
			}
			
			// Set the new line of dialogue
			obj_controller_ui.dialogue = line[cutscene_dialogue_line];
			obj_controller_ui.dialogue_time = 10;
			obj_controller_ui.dialogue_pause = true;
			obj_controller_ui.dialogue_yoff = obj_controller_ui.dialogue_yoff_max;
		
			// Set the dialogue position based on the speaking character
			if (instexists){
				obj_controller_ui.dialogue_x = linefrom[cutscene_dialogue_line].x;
				obj_controller_ui.dialogue_y = linefrom[cutscene_dialogue_line].y - 24;
			}
			
			global.game_in_dialogue = true;
		}
	}
	
	if (instexists){
		obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, inst.x, inst.y);
		
		if (inst.x > obj_player.x){
			obj_player.image_xscale = 1;
		}else{
			obj_player.image_xscale = -1;
		}
		
		var from;
		if (cutscene_dialogue_line != -1){
			// Update dialogue position
			obj_controller_ui.dialogue_x = linefrom[cutscene_dialogue_line].x;
			obj_controller_ui.dialogue_y = linefrom[cutscene_dialogue_line].y - 24;
			
			// Set the camera position based on speaker
			from = linefrom[cutscene_dialogue_line];
			x_to = from.x;
			y_to = from.y - 8;
		}else{
			// Set the camera position to the next upcoming speaker
			from = linefrom[cutscene_dialogue_line + 1];
			x_to = from.x;
			y_to = from.y - 8;
		}
	}else{
		if (x_to != obj_player.x) && (y_to != obj_player.y){
			obj_player.flashlight_direction = point_direction(obj_player.x, obj_player.y, x_to, y_to);
		}
	}
	
	// Dialogue skipping
	if (obj_controller_ui.dialogue_skip >= obj_controller_ui.dialogue_skip_max){
		switch(inst){
			case obj_thescorched:
				if (is_last_interaction){
					global.game_boss_thescorched_talked = true;
				}
				break;
			
			case obj_thedogkeeper:
				global.game_boss_thedogkeeper_talked = true;
				break;
			
			case obj_antagonist:
				if (is_last_interaction){
					global.game_boss_firstantag_talked = true;
				}
				break;
			
			case obj_enemy_0:
				if (inst.type == Enemy0_Type.TrainBoss){
					global.game_boss_trainhorde_talked = true;
				}
				break;
		}
		
		global.cutscene_current = -1;
		global.cutscene_time[index] = 0;
		
		obj_player.move_x_to = -1;
		obj_player.move_y_to = -1;
		obj_player.move_extSpd = 0;
		
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