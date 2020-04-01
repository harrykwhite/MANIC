if (component_spawn){
	var compcount = 4;
	
	switch(type){
		case 0:
			sprite_index = spr_train_0_part_2;
			break;
		
		case 1:
			sprite_index = spr_train_1_part_2;
			break;
	}
	
	for(var i = 1; i < compcount + 1; i ++){
		component[i - 1] = instance_create_layer(x + ((i * 112) * -dir), y, "Trains", obj_pawn_other_train_1);
		component[i - 1].spd = spd;
		component[i - 1].dir = dir;
		component[i - 1].count = i - 1;
		component[i - 1].type = type;
		component[i - 1].is_boss = is_boss;
		component[i - 1].leader = id;
		
		if (i - 1 == floor(compcount / 2)){
			component[i - 1].sound_handler = true;
		}
		
		if (i - 1 == cutscene_opening_count){
			obj_controller_gameplay.cutscene_trainopening_inst = component[i - 1];
		}
		
		if (i == compcount){
			switch(type){
				case 0:
					component[i - 1].sprite_index = spr_train_0_part_1;
					break;
				
				case 1:
					component[i - 1].sprite_index = spr_train_1_part_1;
					break;
			}
			
			component[i - 1].mainsprite = component[i - 1].sprite_index;
		}
		
		component[i - 1].image_speed = image_speed;
		component[i - 1].image_index = image_index;
	}
	
	mylight = instance_create_layer(x + (53 * sign(image_xscale)), y, "Lights", obj_pawn_other_train_light);
	
	hitbox = instance_create_layer(x, y, "Hitbox", obj_train_hitbox_0);
	hitbox.owner = id;
	
	component_spawn = false;
}

if (!open_set){
	if (count == cutscene_opening_count) && (global.cutscene_current != 47) && (!is_boss){
		open = true;
		open_pause = false;
	}
	
	open_set = true;
}

if (!sprite_set){
	if (sprite_index == spr_train_0_part_0_door){
		switch(type){
			case 1:
				sprite_index = spr_train_1_part_0_door;
				break;
		}
	}
	
	sprite_set = true;
}

if (mainsprite == noone){
	mainsprite = sprite_index;
}