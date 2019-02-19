if (activate ){
	var length = array_length_1d(object);
	
	for(var i = 0; i < length; i++){
		if (object[i] != noone){
			if (!instance_exists(object_inst[i])){
				object_inst[i] = instance_create(object_x[i], object_y[i], object[i]);
				
				if (object_weapon[i] != -1){
					object_inst[i].index = object_weapon[i];
					object_inst[i].angle = object_weapon_angle[i];
					object_inst[i].pack = object_weapon_pack[i];
					object_inst[i].quantity = object_weapon_quantity[i];
				}
			}
		}
	}
	
	activate = false;
}