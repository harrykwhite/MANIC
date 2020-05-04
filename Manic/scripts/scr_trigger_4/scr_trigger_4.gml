with(obj_controller_prologue){
	var child0 = inst_3992F7F2;
	var child1 = inst_1FCF6CFC;
	var wife = inst_6C02B40B;

	instance_activate_all();
	
	if (instance_exists(obj_bed_small_0)){
		with(obj_bed_small_0){
			fire = true;
		}
	}
	
	if (instance_exists(obj_bed_large_0)){
		with(obj_bed_large_0){
			fire = true;
		}
	}
	
	if (instance_exists(obj_table_0)){
		with(obj_table_0){
			fire = true;
		}
	}
	
	if (instance_exists(obj_chair_0)){
		with(obj_chair_0){
			fire = true;
		}
	}
	
	if (instance_exists(obj_farmbuilding_door_0)){
		with(obj_farmbuilding_door_0){
			death = true;
			death_effects = false;
		}
	}
	
	var firesound = instance_create(502, 544, obj_block_sound);
	firesound.sound = snd_character_burn_0;
	firesound.radius = 600;

	var child0corpse = instance_create(child0.x, child0.y, obj_enemy_corpse);
	child0corpse.sprite_index = spr_player_child_0_corpse_0;
	
	repeat(2){
		instance_create(child0.x, child0.y + random_range(10, 12), obj_ef_fly);
	}
	
	var child1corpse = instance_create(child1.x, child1.y, obj_enemy_corpse);
	child1corpse.sprite_index = spr_player_child_1_corpse_0;
	
	repeat(3){
		instance_create(child1.x, child1.y + random_range(10, 12), obj_ef_fly);
	}
	
	var wifecorpse = instance_create(wife.x, wife.y, obj_enemy_corpse);
	wifecorpse.sprite_index = spr_player_wife_corpse_0;
	
	repeat(3){
		instance_create(wife.x, wife.y + random_range(10, 12), obj_ef_fly);
	}
	
	instance_destroy(child0);
	instance_destroy(child1);
	instance_destroy(wife);

	instance_destroy(obj_farmbuilding_3);
	instance_destroy(obj_farmbuilding_4);
	
	var lightx = 486;
	var lighty = 546;
	
	if (instance_place(lightx, lighty, obj_block_light) == noone){
		var light = instance_create(lightx, lighty, obj_block_light);
		light.size[0] = 360;
		light.time = -1;
	}
	
	var robotprop = instance_create_layer(446, 722, "EndingObjects", obj_pawn_other_robotrunning_0);
	robotprop.dir = 180;
	robotprop.dir_to = robotprop.dir;

	robotprop = instance_create_layer(562, 570, "EndingObjects", obj_pawn_other_robotrunning_0);
	robotprop.dir = 360;
	robotprop.dir_to = robotprop.dir;

	robotprop = instance_create_layer(512, 550, "EndingObjects", obj_pawn_other_robotrunning_0);
	robotprop.dir = 360;
	robotprop.dir_to = robotprop.dir;

	robotprop = instance_create_layer(756, 552, "EndingObjects", obj_pawn_other_robotrunning_0);
	robotprop.dir = 270;
	robotprop.dir_to = robotprop.dir;
	
	var pblock = instance_create(590, 560, obj_block_particle);
	pblock.spawn = true;
	
	pblock = instance_create(426, 546, obj_block_particle);
	pblock.spawn = true;
	
	pblock = instance_create(580, 574, obj_block_particle);
	pblock.spawn = true;
	
	pblock = instance_create(700, 558, obj_block_particle);
	pblock.spawn = true;
}