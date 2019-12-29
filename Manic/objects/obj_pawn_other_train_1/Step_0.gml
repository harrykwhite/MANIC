var level = scr_level_get_object();
interact = false;

if (global.game_pause){
	image_speed = 0;
	return;
}

while (spd <= 0.2) && (instance_exists(obj_player)){
	if (room == rm_level_6_00){
		if (instance_exists(level.trainboss_leader)){
			break;
		}
	}
	
	if (scr_enemy_count(true) <= 1) && (is_boss){
		if (count == cutscene_opening_count){
			if (horde_spawn_wave < 3){
				if (horde_spawn_time < horde_spawn_time_max){
					horde_spawn_time ++;
				}else{
					if (horde_spawn_opentime == round(horde_spawn_opentime_max / 2)){
						horde_dospawn = true;
						if (horde_spawn_wave == 1){ leader.component[0].horde_dospawn = true };
						if (horde_spawn_wave == 2){ leader.component[0].horde_dospawn = true; leader.component[2].horde_dospawn = true };
					}
			
					if (horde_spawn_opentime < horde_spawn_opentime_max){
						horde_spawn_opentime ++;
						open = true;
						if (horde_spawn_wave == 1){ leader.component[0].open = true };
						if (horde_spawn_wave == 2){ leader.component[0].open = true; leader.component[2].open = true };
					}else{
						horde_spawn_time = 0;
						horde_spawn_opentime = 0;	
					
						open = false;
						open_time = 0;
						open_pause = false;
				
						close = true;
					
						switch(type){
							case 0:
								sprite_index = spr_train_0_part_0_door_open;
								break;
		
							case 1:
								sprite_index = spr_train_1_part_0_door_open;
								break;
						}
						
						image_index = 0;
						image_speed = 0;
					
						for (var i = 0; i < 2; i ++){
							if (horde_spawn_wave == 1 + i){
								with(leader.component[0]){
									open = false;
									open_time = 0;
									open_pause = false;
									close = true;
							
									switch(type){
										case 0:
											sprite_index = spr_train_0_part_0_door_open;
											break;
		
										case 1:
											sprite_index = spr_train_1_part_0_door_open;
											break;
									}
									image_index = 0;
									image_speed = 0;
								}
								
								if (i == 1){
									with(leader.component[2]){
										open = false;
										open_time = 0;
										open_pause = false;
										close = true;
							
										switch(type){
											case 0:
												sprite_index = spr_train_0_part_0_door_open;
												break;
		
											case 1:
												sprite_index = spr_train_1_part_0_door_open;
												break;
										}
										image_index = 0;
										image_speed = 0;
									}
								}
							}
						}
					
						horde_spawn_wave ++;
					}
				}
			}else{
				open = true;
				is_boss = false;
				
				var length = array_length_1d(leader.component);
				for(var i = 0; i < length; i ++){
					leader.component[i].is_boss = false;
				}
				
				level.trainboss_leader = instance_create(x, y + 30, obj_enemy_0);
				level.trainboss_leader.type = Enemy0_Type.TrainBoss;
				level.trainboss_leader.weapon_index = PawnWeapon.SniperRifle;
				
				repeat(9){
					part_particles_create(global.ps_front, x + random_range(-7, 7), y + 30 + random_range(-18, 18), global.pt_spawn_0, 1);
				}
				
				global.cutscene_current = 58;
			}
		}
	}

	if (global.cutscene_current == -1) && (!is_boss) && (global.boss_current == -1){
		if (interact_break > 0){
			interact_break --;
		}else{
			if (count == cutscene_opening_count){
				if (point_distance(x, y + 6, obj_player.x, obj_player.y) < 30){
					if (obj_player.y > y){
						interact = true;
						scr_ui_control_indicate("Board Train");
						if (scr_input_is_pressed(InputBinding.Interact) && global.player_stamina_active){
							interact_break = 10;
							
							obj_controller_ui.pausedialogue = true;
							obj_controller_ui.pausedialogue_type = 1;
							obj_controller_ui.pausedialogue_type_text = "Travel to " + (room == rm_level_6_00 ? "The Cemetery" : "the Train Station") + "?";
							obj_controller_ui.pausedialogue_option_exittext = "Resume";
							obj_controller_ui.pausedialogue_type_option[0] = "Enter the train";
							obj_controller_ui.pausedialogue_type_option_scale[0] = 1;
							obj_controller_ui.pausedialogue_type_option_special[0] = 1;
							obj_controller_ui.pausedialogue_type_option_cutscene[0] = 51;
							obj_controller_ui.pausedialogue_option_max = 1;
							
							scr_player_stamina_drain(4);
							scr_toggle_pause(true);
						}
					}
				}
			}
		}
	}
	break;
}

if (open){
	switch(type){
		case 0:
			sprite_index = spr_train_0_part_0_door_open;
			break;
		
		case 1:
			sprite_index = spr_train_1_part_0_door_open;
			break;
	}
	
	if (open_pause){
		if (open_time < 30){
			if (global.cutscene_current == 22) || (global.cutscene_current == 51){
				open_time ++;
			}
			
			image_index = image_number - 1;
			image_speed = 0;
		}else{
			open_time = 0;
			open = false;
			open_pause = false;
			
			close = true;
			
			switch(type){
				case 0:
					sprite_index = spr_train_0_part_0_door_close;
					break;
		
				case 1:
					sprite_index = spr_train_1_part_0_door_close;
					break;
			}
			
			image_index = 0;
			image_speed = 0;
		}
	}else{
		image_speed = 1;
	}
}else if (close){
	switch(type){
		case 0:
			sprite_index = spr_train_0_part_0_door_close;
			break;
		
		case 1:
			sprite_index = spr_train_1_part_0_door_close;
			break;
	}
	image_speed = 1;
}else{
	if (mainsprite != noone){
		sprite_index = mainsprite;
	}
	
	image_speed = 0.1 * (spd / 4);
	if (spd <= 0){
		image_index = 0;
	}
}

x += spd * dir;
if (spd > 0) || ((leave) && (!stop_on_end)){
	if (leave){
		spd += 0.0075 * 1.35;
	}else{
		if (is_boss){
			spd -= 0.015;
		}else{
			spd -= 0.0075;
		}
	}
}

spd = max(spd, 0);

if (dir == 1){
	image_xscale = 1;
}else{
	image_xscale = -1;
}

if (horde_dospawn){
	repeat(3){
		var xx = x + random_range(-25, 25);
		var yy = y + 34 + random_range(-5, 25);
		var enemy = instance_create(xx, yy, obj_enemy_0);
		enemy.weapon_index = choose(PawnWeapon.Axe, PawnWeapon.Crowbar, PawnWeapon.Rake);
		enemy.move_speed_offset = random_range(1.2, 1.45);
		enemy.sporadic = true;
		
		for(var i = 0; i < 18; i ++){
			if (leader.boss_entity[i] == noone){
				leader.boss_entity[i] = enemy;
				break;
			}
		}
		
		repeat(9){
			part_particles_create(global.ps_front, xx + random_range(-7, 7), yy + random_range(-18, 18), global.pt_spawn_0, 1);
		}
	}
	
	horde_dospawn = false;
}

if (is_boss) && (count == -1){
	var bosshp = 0;
	var leaderhp = 45;
	
	if (instance_exists(level.trainboss_leader)){
		leaderhp = level.trainboss_leader.health_current;
	}
	
	for(var i = 0; i < 18; i ++){
		if (boss_entity[i] == noone){
			bosshp += 6;
			continue;
		}
		
		if (instance_exists(boss_entity[i])){
			bosshp += boss_entity[i].health_current;
		}
	}
	
	obj_controller_ui.bosshealth_value_current = leaderhp + bosshp;
	obj_controller_ui.bosshealth_value_max = 45 + (18 * 6);
}

// Light
if (instance_exists(mylight)){
	mylight.x = x + (53 * sign(image_xscale));
	mylight.y = y;
	mylight.Light_Intensity = 1.25;
}