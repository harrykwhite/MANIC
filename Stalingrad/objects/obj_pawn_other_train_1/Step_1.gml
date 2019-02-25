if (component_spawn){
	var comp;
	
	switch(type){
		case 0:
			sprite_index = spr_train_0_part_2;
			break;
		
		case 1:
			sprite_index = spr_train_1_part_2;
			break;
	}
	
	for(var i = 1; i < 5; i++){
		comp = instance_create(x + ((i * 112) * -dir), y, obj_pawn_other_train_1);
		comp.spd = spd;
		comp.dir = dir;
		comp.count = i - 1;
		comp.type = type;
		
		if (i - 1 == cutscene_opening_count){
			obj_controller_gameplay.cutscene_trainopening_inst = comp;
		}
		
		if (i == 4){
			switch(type){
				case 0:
					comp.sprite_index = spr_train_0_part_1;
					break;
				
				case 1:
					comp.sprite_index = spr_train_1_part_1;
					break;
			}
			
			comp.mainsprite = comp.sprite_index;
		}
	}
	
	component_spawn = false;
}

if (!open_set){
	if (count == 2) && (global.cutscene_current != 47){
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