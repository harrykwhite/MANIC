///scr_cutscene_58();
var index = 58, x_to = 0, y_to = 0, special = "", is_last_interaction = false;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

/*

Player: Starts as a strong, "family-centered" character  who is traumatised from the death of his family and is determined to help stop the issue, and in doing so becomes obsessed with violence and revenge. He lived as a farmer prior to the game and I would say is about 30 to 40 years of age.

Farmer companion: Friendly and genuine person who is interested in helping others but notices that his actions towards stopping the issue have become corrupt, abandoning the player's out of the realisation that their actions are centred around fighting rather than saving people. A bit older than the player, 40-50 years of age. Also lived alone as a farmer.

"The Scorched" boss character: Intelligent but psychopathic, confident in his ability to defeat the player. Leads a smaller faction of the robot army which overtook the town and farmland areas of levels one and two. Tall and thin, 20-30 years of age.

Grenadier companion: Confident in his own ability and therefore prefers to fight alone. Engaged in helping stop the issue but not as determined as the player character. 20 to 30 years of age.

"The Dogkeeper" boss character: Selfish and unempathetic, doesn't care for the lives of others even those who are working alongside him. Large and bulky, 40 to 50 years of age.

Prisoner companion: Nervous/anxious character, locked up in a robot prison alongside the rest of his towns people, is one of the only left to survive. Disturbed by the things he's seen. Very quick and sporadic, about 20 years old.

Antagonist: A highly dominant figure who is the leader of the robot army. Confident and determined to win a fight. Initially doubts the player, but sees potential in him later on in the game. Believes in the philosophy that violence and revenge can draw a man into insanity, and proves this by luring the player into a death match at the end of the game, where the antagonist is killed and the player is left as the new leader of the army. Very tall and thing and about 50 years old, lived a similar life as the player and experienced traumatic events which lead him, like the player, into madness.

*/

if (instance_exists(obj_player)){
	var inst = noone;
	var skip = (obj_controller_ui.dialogue_skip >= obj_controller_ui.dialogue_skip_max);
	var line, linefrom, inst_talking = false;
	
	switch(room){
		case rm_prologue_00:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_player_wife_0);
			special = "wifetalk";
			
			global.game_npc_player_wife_talked = true;
			
			line[0] = "Hey honey, are you able to get gather some food for tonight?";
			linefrom[0] = inst;
			
			line[1] = "Sure, I'll do that now.";
			linefrom[1] = obj_player;
			break;
		
		case rm_level_1_00:
			var insts, insts_ymin, insts_ymax, insts_count;
			special = "townpersonescort";
			
			insts[0] = instance_nearest(obj_player.x, obj_player.y, obj_townperson_0);
			insts_ymin[0] = 826;
			insts_ymax[0] = 1292;
			
			insts[1] = instance_nearest(obj_player.x, obj_player.y, obj_townperson_1);
			insts_ymin[1] = 1746;
			insts_ymax[1] = room_height;
			
			insts[2] = instance_nearest(obj_player.x, obj_player.y, obj_townperson_3);
			insts_ymin[2] = 0;
			insts_ymax[2] = 826;
			
			insts[3] = instance_nearest(obj_player.x, obj_player.y, obj_townperson_4);
			insts_ymin[3] = 1292;
			insts_ymax[3] = 1746;
			
			insts_count = array_length_1d(insts);
			
			for(var i = 0; i < insts_count; i ++){
				if (insts[i] != noone) && (obj_player.y >= insts_ymin[i]) && (obj_player.y <= insts_ymax[i]){
					inst = insts[i];
					inst_talking = true;
					
					switch(i){
						case 0:
							global.game_npc_townperson0_talked = true;
							
							line[0] = "Are you okay?";
							linefrom[0] = obj_player;
							
							line[1] = "Yes... I'm alright...";
							linefrom[1] = inst;
							
							line[2] = "Could you tell me what has happened?";
							linefrom[2] = obj_player;
							
							line[3] = "Large groups of them ran into the town...";
							linefrom[3] = inst;
							
							line[4] = "They murdered our people... they ravaged our houses...";
							linefrom[4] = inst;
							
							line[5] = "I'm not even sure how long I've been waiting here...";
							linefrom[5] = inst;
							
							line[6] = "I understand. From here I can escort you over to the west where it is safe.";
							linefrom[6] = obj_player;
							
							line[7] = "Hopefully there you'll be able to find a place to stay.";
							linefrom[7] = obj_player;
							
							line[8] = "Okay, thank you...";
							linefrom[8] = inst;
							break;
						
						case 1:
							global.game_npc_townperson1_talked = true;
							
							line[0] = "Hello?";
							linefrom[0] = obj_player;
							
							line[1] = "Hi. Were you one of the citizens here?";
							linefrom[1] = inst;
							
							line[2] = "No, I'm from a farmhouse up north.";
							linefrom[2] = obj_player;
							
							line[3] = "What about you?";
							linefrom[3] = obj_player;
							
							line[4] = "A friend of mine had been staying here for a couple nights.";
							linefrom[4] = inst;
							
							line[5] = "When I heard what had happened, I immediately came over here to see if he was okay.";
							linefrom[5] = inst;
							
							line[6] = "The area seems to be deserted, though.";
							linefrom[6] = inst;
							
							line[7] = "He may have escaped to the south or west. Those would be the best options, as I doubt those areas have been taken over yet. If I were you, I'd look there first.";
							linefrom[7] = obj_player;
							
							line[8] = "Hopefully they've found somewhere to stay in the meantime. Somewhere safe.";
							linefrom[8] = obj_player;
							
							line[9] = "As you were coming up here, did you locate where the group were going to?";
							linefrom[9] = obj_player;
							
							line[10] = "Well, I do recall seeing a large group of them approaching a farm to the south-east. They appeared to be lead by some tall, burning figure.";
							linefrom[10] = inst;
							
							line[11] = "Alright, that'll be where I'm heading next.";
							linefrom[11] = obj_player;
							
							line[12] = "I appreciate the dedication. Hopefully this will all be over soon.";
							linefrom[12] = inst;
							break;
						
						case 2:
							global.game_npc_townperson3_talked = true;
														
							line[0] = "Hello, are you alright?";
							linefrom[0] = obj_player;
							
							line[1] = "I'm-uh... no...";
							linefrom[1] = inst;
							
							line[2] = "My town... my people... my life...";
							linefrom[2] = inst;
							
							line[3] = "It's all been destroyed...";
							linefrom[3] = inst;
							
							line[4] = "Everything will be okay. Do you want me to escort you out of here?";
							linefrom[4] = obj_player;
							
							line[5] = "Y-yes please.";
							linefrom[5] = inst;
							
							line[6] = "Okay, follow me.";
							linefrom[6] = obj_player;
							break;
						
						case 3:
							global.game_npc_townperson4_talked = true;
							
							line[0] = "What do you want from me...?";
							linefrom[0] = inst;
							
							line[1] = "I'm here to help you.";
							linefrom[1] = obj_player;
							
							line[2] = "What can you tell me about the group?";
							linefrom[2] = obj_player;
							
							line[3] = "The group? I saw them... their faces...";
							linefrom[3] = inst;
							
							line[4] = "It's as if they just planted a mask onto a person's face...";
							linefrom[4] = inst;
							
							line[5] = "An entire horde of them were gathering around me, gripping onto their weapons.";
							linefrom[5] = inst;
							
							line[6] = "So I hid in here... thankfully they couldn't find me.";
							linefrom[6] = inst;
							
							line[7] = "I... I'm just not sure what to do...";
							linefrom[7] = inst;
							
							line[8] = "You'll be alright. I'll take you to the west where it is safe, you should be able to find a place to stay.";
							linefrom[8] = obj_player;
							
							line[9] = "Okay, thank you.";
							linefrom[9] = inst;
							break;
					}
					
					break;
				}
			}
			
			if (inst_talking){
				var idist = point_distance(obj_player.x, obj_player.y, inst.x, inst.y);
				var idir = point_direction(obj_player.x, obj_player.y, inst.x, inst.y);
				
				if (idist > 80){
					obj_player.move_x_to = inst.x;
					obj_player.move_y_to = inst.y;
					obj_player.move_ext_spd = 1.25;
				}else if (idist < 40){
					obj_player.move_x_to = inst.x + lengthdir_x(100, idir - 180);
					obj_player.move_y_to = inst.y + lengthdir_y(100, idir - 180);
					obj_player.move_ext_spd = 1.25;
				}else{
					obj_player.move_x_to = -1;
					obj_player.move_y_to = -1;
					obj_player.move_ext_spd = 0;
				}
			}
			break;
		
		case rm_level_2_00:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_companion_0);
			special = "farmertalk";
			
			line[0] = "Have you seen what's happening? The invasion?";
			linefrom[0] = inst;
			
			line[1] = "I have. A person from the town up north said that he saw a group of them approaching this farm?";
			linefrom[1] = obj_player;
			
			line[2] = "That'd be correct. I've been trying to fight them off, but they only seem to be increasing in numbers.";
			linefrom[2] = inst;
			
			line[3] = "How about we make a team? You and I? This army isn't going to fight itself.";
			linefrom[3] = obj_player;
			
			line[4] = "Sure! I will gladly join you.";
			linefrom[4] = inst;
			
			line[5] = "Alright, great. The man I was speaking to earlier, he recounts seeing some kind of... burning figure?";
			linefrom[5] = obj_player;
			
			line[6] = "I may know what he was talking about. I didn't see it all, but I may remember someone like that heading towards the south.";
			linefrom[6] = inst;
			
			line[7] = "Let's go there first, to see what's going on.";
			linefrom[7] = inst;
			
			line[8] = "And while we're at it, we should search around the area for artifacts. They may give us some more hints as to what's happening.";
			linefrom[8] = inst;
			
			line[9] = "Good idea, let's go.";
			linefrom[9] = obj_player;
			break;
		
		case rm_level_2_04:
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
					
					script_execute(scr_cutscene_40);
				}
				return;
			}
			
			if (inst.health_current <= inst.health_max / 2){
				is_last_interaction = true;
				
				line[0] = "So much hostility from a man of peace?";
				linefrom[0] = inst;
				
				line[1] = "Let's see how you go against this!";
				linefrom[1] = inst;
			}else{
				line[0] = "You... you seem familiar.";
				linefrom[0] = inst;
				
				line[1] = "Weren't you the one from the house up north?";
				linefrom[1] = inst;
				
				line[2] = "I see you came back to stop us, after what we did to your family.";
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
			
			global.game_companion_farmer_level2post_talked_0 = true;
			global.game_companion_farmer_level2post_talked_1 = true;
			
			line[0] = "Up here! From memory, this bunker was originally used as a place for soldiers to retreat to during the war.";
			linefrom[0] = inst;
			
			line[1] = "However it's most likely already been taken over by the group, possibly transforming it into a base.";
			linefrom[1] = inst;
			
			line[2] = "Let's go and shut it down, so that no more of these masked enemies can be produced. At least in this area.";
			linefrom[2] = obj_player;
			
			line[3] = "If we're fortunate, there may even be some people inside who have information reguarding where the group came from.";
			linefrom[3] = obj_player;
			
			line[4] = "Alright, let's go.";
			linefrom[4] = obj_player;
			break;
		
		case rm_level_3_01:
			if (cutscene_dialogue_bunker_engine_destroy){
				break;
			}
			
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
		
		case rm_level_3_post_00:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_companion_1);
			
			if (instance_exists(inst)){
				special = "grenadierdepart";
				
				line[0] = "Alright, this looks to be the end of the base.";
				linefrom[0] = obj_player;
				
				line[1] = "You can leave down here.";
				linefrom[1] = obj_player;
				
				line[2] = "Thank you. We appreciate the help!";
				linefrom[2] = obj_companion_0;
				
				line[3] = "No problem.";
				linefrom[3] = inst;
				
				line[4] = "You're aiming to stop the entire army, aren't you?";
				linefrom[4] = inst;
				
				line[5] = "Yes, that's the plan. We need to put an end to their destruction.";
				linefrom[5] = obj_player;
				
				line[6] = "Those are definitely good intentions.";
				linefrom[6] = inst;
				
				line[7] = "Well, best of luck.";
				linefrom[7] = inst;
			}else{
				global.cutscene_current = 52;
				global.cutscene_time[index] = 0;
				
				with(obj_controller_gameplay){
					cutscene_moveto_dir = 3;
					cutscene_moveto_level = Level.WinterTown;
					cutscene_moveto_room = rm_level_4_pre_00;
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
					
					script_execute(scr_cutscene_40);
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
				
				line[5] = "Oh, him? He was just a tool. We didn't need that useless imbecile.";
				linefrom[5] = inst;
				
				line[6] = "You have no idea what's coming for you. I appreciate the enthusiasm, though.";
				linefrom[6] = inst;
				
				line[7] = "Let it proceed.";
				linefrom[7] = inst;
			}
			break;
		
		case rm_level_4_03:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_townperson_2);
			
			if (inst != noone){
				global.game_npc_townperson2_talked = true;
				inst_talking = true;
				
				line[0] = "Hello? Are you okay?";
				linefrom[0] = obj_player;
				
				line[1] = "I-I'm not...";
				linefrom[1] = inst;
				
				line[2] = "How long have you been here?";
				linefrom[2] = obj_player;
				
				line[3] = "Several hours, maybe even a day... I can't tell anymore.";
				linefrom[3] = inst;
				
				line[4] = "Could you explain to us what you saw?";
				linefrom[4] = obj_player;
				
				line[5] = "Yes... uh... a large horde of them rushed down from the north, presumably from that bunker up there.";
				linefrom[5] = inst;
				
				line[6] = "At the front of the horde I saw a tall man with a mask, much taller than the others, directing each of the followers to different areas.";
				linefrom[6] = inst;
				
				line[7] = "In particular I remember seeing a much larger follower, wearing a longer mask and holding back a set of dogs.";
				linefrom[7] = inst;
				
				line[8] = "Yes... we know of that man. We killed him.";
				linefrom[8] = obj_player;
				
				line[9] = "I see... so are you here to help me?";
				linefrom[9] = inst;
				
				line[10] = "You should be able to help yourself. Just make your way down to the south, I imagine it'd be safer there.";
				linefrom[10] = obj_player;
				
				line[11] = "Okay.";
				linefrom[11] = inst;
			}
			break;
		
		case rm_level_4_post_01:
			var insts, insts_xmin, insts_xmax, insts_count;
			
			insts[0] = instance_nearest(obj_player.x, obj_player.y, obj_townperson_5);
			insts_xmin[0] = 0;
			insts_xmax[0] = 932;
			
			insts[1] = instance_nearest(obj_player.x, obj_player.y, obj_townperson_6);
			insts_xmin[1] = 932;
			insts_xmax[1] = room_width;
			
			insts_count = array_length_1d(insts);
			
			for(var i = 0; i < insts_count; i ++){
				if (insts[i] != noone) && (obj_player.x >= insts_xmin[i]) && (obj_player.x <= insts_xmax[i]){
					inst = insts[i];
					inst_talking = true;
					
					switch(i){
						case 0:
							global.game_npc_townperson5_talked = true;
							special = "townpersonescort";
							
							line[0] = "Hello. Is everything alright? Can you tell me what happened?";
							linefrom[0] = obj_player;
							
							line[1] = "At about... I don't know... sometime at night... piercingly loud screaming noises woke me up.";
							linefrom[1] = inst;
							
							line[2] = "I... I think that they were coming from up north. It's hard to tell.";
							linefrom[2] = inst;
							
							line[3] = "I can't remember anything that happened after that, I'm so sorry...";
							linefrom[3] = inst;
							
							line[4] = "I've just been standing here, paralysed by fear...";
							linefrom[4] = inst;
							
							line[5] = "I just don't know what to do... how to get out of this...";
							linefrom[5] = inst;
							
							line[6] = "I feel so weak for not helping my son...";
							linefrom[6] = inst;
							
							line[7] = "This can't be the end...";
							linefrom[7] = inst;
							
							line[8] = "Everything will be okay, I promise.";
							linefrom[8] = obj_companion_0;
							
							line[9] = "We'll escort you further down south, where it is safe.";
							linefrom[9] = obj_companion_0;
							
							line[10] = "There you should be able to find a place for you and your son to stay.";
							linefrom[10] = obj_companion_0;
							
							line[11] = "Th-thank you...";
							linefrom[11] = inst;
							break;
						
						case 1:
							global.game_npc_townperson6_talked = true;
							special = "prisonenter";
							
							line[0] = "Hello?";
							linefrom[0] = inst;
							
							line[1] = "Hi. What are you able to tell me about the town raid?";
							linefrom[1] = obj_player;
							
							line[2] = "Well... around midnight I was awoken by the sound of gunshots from up north.";
							linefrom[2] = inst;
							
							line[3] = "Going outside, I saw hordes of zombie-looking people raiding the upper towns, shooting many of the civilians.";
							linefrom[3] = inst;
							
							line[4] = "In shock I sprinted down south and hid behind one of the trees, watching as they raided the entire area.";
							linefrom[4] = inst;
							
							line[5] = "Once they suspected it had all been emptied and had left, I ran back into this house to stay safe.";
							linefrom[5] = inst;
							
							line[6] = "On the floor I found this key that one of them must have dropped. It's most likely for access to the prison in the east, as that's where I saw them heading.";
							linefrom[6] = inst;
							
							line[7] = "I've been too afraid to check if it actually is for it, though. You guys are trying to stop them, right?";
							linefrom[7] = inst;
							
							line[8] = "Yes, that's the plan.";
							linefrom[8] = obj_player;
							
							line[9] = "In that case, I'm happy to help get you in there... assuming that you'll protect me on the way, of course.";
							linefrom[9] = inst;
							
							line[10] = "We can do that, sure!";
							linefrom[10] = obj_companion_0;
							
							line[11] = "Alright, let me know when you're ready to go.";
							linefrom[11] = inst;
							break;
					}
					
					break;
				}
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
				
					line[5] = "I heard one of the windows being smashed open... a horde of masked people running in.";
					linefrom[5] = inst;
					
					line[6] = "They knocked me onto the ground with a crowbar. After that, everything went black...";
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
				if (!global.game_companion_prisoner_found){
					scr_objective_update_counter();
					global.game_companion_prisoner_found = true;
				}
				
				line[0] = "...";
				linefrom[0] = inst;
				
				line[1] = "Hi! We're here to get you out of this prison.";
				linefrom[1] = obj_companion_0;
				
				line[2] = "Okay...";
				linefrom[2] = inst;
				
				line[3] = "Are... are you trying to stop them?";
				linefrom[3] = inst;
				
				line[4] = "I can fight alongside you... if you need...";
				linefrom[4] = inst;
				
				line[5] = "That'd be very useful.";
				linefrom[5] = obj_player;
				
				line[6] = "We'd love that! Thank you.";
				linefrom[6] = obj_companion_0;
			}
			break;
		
		case rm_level_5_post_00:
			inst = instance_nearest(obj_player.x, obj_player.y, obj_companion_2);
			
			if (instance_exists(inst)){
				special = "prisonerdepart";
				
				line[0] = "Here's the exit, you can leave now.";
				linefrom[0] = obj_player;
				
				line[1] = "Thanks for the assistance! It would have been really difficult without your help.";
				linefrom[1] = obj_companion_0;
				
				line[2] = "That's okay... it feels great to finally be getting out of here.";
				linefrom[2] = inst;
				
				line[3] = "J-just to let you know, I really appreciate what you two are doing...";
				linefrom[3] = inst;
				
				line[4] = "I guess I'll see you around?";
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
				if (cutscene_dialogue_line >= 5){
					inst = obj_companion_0;
				}
			}
			
			if (inst != noone) && (instance_exists(inst)){
				if (inst.object_index == obj_antagonist){
					if (inst.greatsword_attack_killed){
						cutscene_dialogue_special = 1;
					}
					
					inst.cutscene_prop = true;
					inst.in_cutscene = true;
				}
			}else{
				x_to = obj_player.x;
				y_to = obj_player.y - 8;
			}
			
			if (cutscene_dialogue_special == 1){
				special = "farmerdepart";
				
				line[0] = "It appears you underestimated me.";
				linefrom[0] = inst;
				
				line[1] = "You can find fragments of an ultimate armour set scattered throughout the areas below our city base.";
				linefrom[1] = inst;
				
				line[2] = "Wearing the armour will provide you greater protection against this greatsword.";
				linefrom[2] = inst;
				
				line[3] = "Once you truly think you're worthy, meet me at the city headquarters.";
				linefrom[3] = inst;
				
				line[4] = "There we will fight again.";
				linefrom[4] = inst;
				
				line[5] = "I'm not too sure about this...";
				linefrom[5] = obj_companion_0;
				
				line[6] = "About what?";
				linefrom[6] = obj_player;
				
				line[7] = "We've completely lost track of the bigger picture here.";
				linefrom[7] = obj_companion_0;
				
				line[8] = "This isn't about winning a fight, it's about saving others. This mission isn't about us.";
				linefrom[8] = obj_companion_0;
				
				line[9] = "I can't keep doing this... I-I'm not going to help you any longer.";
				linefrom[9] = obj_companion_0;
				
				line[10] = "I'm sorry...";
				linefrom[10] = obj_companion_0;
				
				line[11] = "...";
				linefrom[11] = obj_player;
				
				line[12] = "...I won't need him.";
				linefrom[12] = obj_player;
			}else{
				is_last_interaction = true;
				
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
						
						script_execute(scr_cutscene_40);
					}
					return;
				}
				
				line[0] = "Ah. I've been waiting for this.";
				linefrom[0] = inst;
				
				line[1] = "You're the leader of the group, aren't you?";
				linefrom[1] = obj_player;
				
				line[2] = "Do you really think you've got the strength to defeat me?";
				linefrom[2] = obj_player;
				
				line[3] = "Oh, for sure.";
				linefrom[3] = inst;
				
				line[4] = "Let's see if you're as good as you think you are!";
				linefrom[4] = inst;
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
						
						script_execute(scr_cutscene_40);
					}
					return;
				}
				
				line[0] = "They told me that there was a farmer with you.";
				linefrom[0] = inst;
				
				line[1] = "It appears not...";
				linefrom[1] = inst;
				
				line[2] = "You'll just have to die alone, then.";
				linefrom[2] = inst;
			}
			break;
	}
	
	if (cutscene_dialogue_bunker_engine_destroy){
		inst = obj_companion_0;
		special = "bunkerenginedestroy";
		
		line[0] = "Over here! This looks like some kind of engine or generator.";
		linefrom[0] = inst;
		
		line[1] = "Perhaps if we destroy all of these engines, they won't be able to use this base for production?";
		linefrom[1] = inst;
		
		inst.bunker_engine_destroy = true;
	}
	
	var instexists = instance_exists(inst);
	
	if (inst_talking){
		var idist = point_distance(obj_player.x, obj_player.y, inst.x, inst.y);
		var idir = point_direction(obj_player.x, obj_player.y, inst.x, inst.y);
		
		if (idist > 80){
			obj_player.move_x_to = inst.x;
			obj_player.move_y_to = inst.y;
			obj_player.move_ext_spd = 1.25;
		}else if (idist < 40){
			obj_player.move_x_to = inst.x + lengthdir_x(100, idir - 180);
			obj_player.move_y_to = inst.y + lengthdir_y(100, idir - 180);
			obj_player.move_ext_spd = 1.25;
		}else{
			obj_player.move_x_to = -1;
			obj_player.move_y_to = -1;
			obj_player.move_ext_spd = 0;
		}
	}
	
	if (global.cutscene_time[index] < 0){
		global.cutscene_time[index] ++;
	}else{
		if (obj_controller_ui.dialogue_next) || (cutscene_dialogue_line == -1) || (skip){
			if (instexists){
				if (special == "farmerdepart"){
					switch(cutscene_dialogue_line){
						case 4:
							inst.walk_off = true;
							break;
						
						case 5:
							obj_companion_0.depart_standaway = true;
							obj_companion_0.depart_standaway_reached = false;
							obj_companion_0.depart = false;
							break;
						
						case 10:
							obj_companion_0.depart_standaway = false;
							obj_companion_0.depart = true;
							break;
					}
				}
			}
			
			obj_controller_ui.dialogue_next = false;
			obj_controller_ui.dialogue_voice_opened = false;
			obj_controller_ui.dialogue_voice_closed = true;
			
			cutscene_dialogue_line ++;
			
			// End the dialogue sequence
			if (cutscene_dialogue_line >= array_length_1d(line)) || (skip){
				if (is_last_interaction) && (instance_exists(inst)){
					switch(inst.object_index){
						case obj_thescorched:
							global.game_boss_thescorched_talked = true;
							break;
					
						case obj_thedogkeeper:
							global.game_boss_thedogkeeper_talked = true;
							break;
					
						case obj_antagonist:
							if (room == rm_level_6_pre_00){
								global.game_boss_firstantag_talked = true;
							}
							break;
					
						case obj_enemy_0:
							if (inst.type == Enemy0_Type.TrainBoss){
								global.game_boss_trainhorde_talked = true;
							}
							break;
					}
				}
				
				global.cutscene_time[index] = 0;
				
				cutscene_dialogue_line = -1;
				cutscene_dialogue_special = -1;
				
				obj_player.move_x_to = -1;
				obj_player.move_y_to = -1;
				obj_player.move_ext_spd = 0;
				
				obj_controller_ui.dialogue_pause = false;
				obj_controller_ui.dialogue_time = 0;
				
				if (special == "farmerdepart") || (special == "grenadierdepart") || (special == "prisonerdepart"){
					global.cutscene_current = 52;
					global.cutscene_camera_x[52] = obj_player.x;
					global.cutscene_camera_y[52] = obj_player.y;
					
					switch(special){
						case "farmerdepart":
							obj_companion_0.cutscene_prop = false;
							
							obj_companion_0.depart_standaway = false;
							obj_companion_0.depart = true;
							
							if (instance_exists(obj_antagonist)){
								obj_antagonist.walk_off = true;
							}
							
							scr_companion_remove(obj_companion_0);
							obj_controller_gameplay.cutscene_moveto_level = Level.TrainStation;
							obj_controller_gameplay.cutscene_moveto_room = rm_level_6_00;
							obj_controller_gameplay.cutscene_moveto_type = 0;
							obj_controller_gameplay.cutscene_moveto_dir = 1;
							obj_controller_gameplay.cutscene_moveto_instant = false;
							break;
						
						case "grenadierdepart":
							obj_companion_1.cutscene_prop = true;
							obj_companion_1.in_cutscene = false;
							obj_companion_1.depart = true;
							
							scr_companion_remove(obj_companion_1);
							obj_controller_gameplay.cutscene_moveto_level = Level.WinterTown;
							obj_controller_gameplay.cutscene_moveto_room = rm_level_4_pre_00;
							obj_controller_gameplay.cutscene_moveto_type = 0;
							obj_controller_gameplay.cutscene_moveto_dir = 3;
							obj_controller_gameplay.cutscene_moveto_instant = false;
							break;
						
						case "prisonerdepart":
							obj_companion_2.cutscene_prop = true;
							obj_companion_2.in_cutscene = false;
							obj_companion_2.depart = true;
							
							scr_companion_remove(obj_companion_2);
							obj_controller_gameplay.cutscene_moveto_level = Level.TrainStation;
							obj_controller_gameplay.cutscene_moveto_room = rm_level_6_pre_00;
							obj_controller_gameplay.cutscene_moveto_type = 0;
							obj_controller_gameplay.cutscene_moveto_dir = 2;
							obj_controller_gameplay.cutscene_moveto_instant = false;
							break;
					}
					
					if (!global.game_is_playthrough) && (room != rm_prologue_00){
						if (obj_controller_gameplay.cutscene_moveto_level != global.level_current){
							obj_controller_gameplay.area_next_room = rm_title_0;
						}
					}
				}else if (special == "townpersonescort"){
					scr_effect_flash_script(0.01, 1, c_black, scr_trigger_2);
					global.cutscene_current = 0;
					
					global.cutscene_camera_x[0] = global.cutscene_camera_x[index];
					global.cutscene_camera_y[0] = global.cutscene_camera_y[index];
				}else if (special == "wifetalk"){
					global.cutscene_current = 40;
					
					global.cutscene_camera_x[40] = global.cutscene_camera_x[index];
					global.cutscene_camera_y[40] = global.cutscene_camera_y[index];
					
					with(obj_controller_gameplay){
						cutscene_look_x = 550;
						cutscene_look_y = 768;
						cutscene_look_time = 80;
						cutscene_look_object = noone;
						cutscene_look_prop = false;
					}
				}else if (special == "firstantagtalk"){
					global.game_boss_firstantag_talked = true;
				}else{
					if (special == "farmertalk"){
						scr_objective_change(Objectives.CollectAllArtifacts, global.level_collectable_current[global.level_current], global.level_collectable_number[global.level_current]);
					}
					
					if (special == "bunkerenginedestroy"){
						scr_objective_change(Objectives.DestroyProductionEngines, 0, 5);
						inst.bunker_engine_destroy = false;
						cutscene_dialogue_bunker_engine_destroy = false;
					}
					
					global.cutscene_current = -1;
					inst.cutscene_prop = false;
					inst.in_cutscene = false;
				}
				
				scr_player_stamina_drain(4);
				return;
			}
			
			// Set the new line of dialogue
			obj_controller_ui.dialogue = line[cutscene_dialogue_line];
			obj_controller_ui.dialogue_voice = snd_character_dialogue_generic_in;
			obj_controller_ui.dialogue_time = 10;
			obj_controller_ui.dialogue_pause = true;
			obj_controller_ui.dialogue_length = string_length(obj_controller_ui.dialogue);
			obj_controller_ui.dialogue_char_count = 0;
			
			if (instexists){
				// Set the dialogue position based on the speaking character
				obj_controller_ui.dialogue_x = linefrom[cutscene_dialogue_line].x;
				obj_controller_ui.dialogue_y = linefrom[cutscene_dialogue_line].y - 24;
				
				// Get the voice of the character speaking
				var voice = snd_character_dialogue_generic_in;
				
				switch(linefrom[cutscene_dialogue_line].object_index){
					case obj_player: voice = snd_character_dialogue_protagonist_in; break;
					case obj_companion_0: voice = snd_character_dialogue_compfarmer_in; break;
					case obj_companion_1: voice = snd_character_dialogue_compgrenadier_in; break;
					case obj_antagonist: voice = snd_character_dialogue_antagonist_in; break;
					case obj_thescorched: voice = snd_character_dialogue_thescorched_in; break;
					case obj_thedogkeeper: voice = snd_character_dialogue_thedogkeeper_in; break;
				}
				
				obj_controller_ui.dialogue_voice = voice;
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
	
	// Set camera position
	global.cutscene_camera_x[index] = x_to;
	global.cutscene_camera_y[index] = y_to;
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
	cutscene_dialogue_line = -1;
	cutscene_dialogue_special = -1;
}