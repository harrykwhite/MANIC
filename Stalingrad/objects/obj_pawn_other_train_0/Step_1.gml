if (component_spawn){
	var comp;
	sprite_index = spr_train_0_part_2;
	
	for(var i = 1; i < 9; i++){
		comp = instance_create(x + ((i * 112) * -dir), y, obj_pawn_other_train_0);
		comp.spd = spd;
		comp.dir = dir;
		
		if (i == 8){
			comp.sprite_index = spr_train_0_part_1;
		}
	}
	
	component_spawn = false;
}