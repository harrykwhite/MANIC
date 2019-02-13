if (component_spawn){
	var comp;
	sprite_index = spr_train_0_part_2;
	
	for(var i = 1; i < 9; i++){
		comp = instance_create(x + ((i * 112) * -dir), y, obj_pawn_other_train_1);
		comp.spd = spd;
		comp.dir = dir;
		comp.count = i - 1;
		
		if (i - 1 == cutscene_opening_count){
			obj_controller_gameplay.cutscene_trainopening_inst = comp;
		}
		
		if (i == 8){
			comp.sprite_index = spr_train_0_part_1;
			comp.mainsprite = spr_train_0_part_1;
		}
	}
	
	component_spawn = false;
}

if (mainsprite == noone){
	mainsprite = sprite_index;
}