with(obj_controller_prologue){
	var child0 = inst_3992F7F2;
	var child1 = inst_1FCF6CFC;
	var wife = inst_6C02B40B;

	instance_activate_all();

	with(obj_bed_small_0){
		fire = true;
	}

	with(obj_bed_large_0){
		fire = true;
	}

	with(obj_table_0){
		fire = true;
	}

	with(obj_chair_0){
		fire = true;
	}

	var cratecount = instance_number(obj_crate_0);

	for(var i = 0; i < cratecount; i ++){
		var thiscrate = instance_find(obj_crate_0, i);
	
		if (instance_exists(thiscrate)){
			if (thiscrate.x < 1038){
				with(thiscrate){
					var brk = instance_create(x, y, obj_break);
					brk.sprite_index = spr_crate_0_break;
				}
		
				instance_destroy(thiscrate);
			}
		}
	}

	var light = instance_create(466, 552, obj_block_light);
	light.size[0] = 560;
	light.time = -1;

	var firesound = instance_create(502, 544, obj_block_sound);
	firesound.sound = snd_character_burn_0;
	firesound.radius = 600;

	var child0corpse = instance_create(child0.x, child0.y, obj_enemy_corpse);
	child0corpse.sprite_index = spr_player_child_0_corpse_0;

	var child1corpse = instance_create(child1.x, child1.y, obj_enemy_corpse);
	child1corpse.sprite_index = spr_player_child_1_corpse_0;

	var wifecorpse = instance_create(wife.x, wife.y, obj_enemy_corpse);
	wifecorpse.sprite_index = spr_player_wife_corpse_0;

	instance_destroy(child0);
	instance_destroy(child1);
	instance_destroy(wife);

	instance_destroy(obj_farmbuilding_3);
	instance_destroy(obj_farmbuilding_4);

	var gundrop = instance_create(652, 500, obj_weapondrop);
	gundrop.index = PlayerWeapon.Revolver;
	gundrop.angle = 30;

	var knifedrop = instance_create(652 - 10, 500 + 10, obj_weapondrop);
	knifedrop.index = PlayerWeapon.Knife;
	knifedrop.angle = 110;

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
}