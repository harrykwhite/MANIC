// Particles
if (part > 0){
	part --;
}else{
	if (!part_system_exists(global.ps_front)){
		global.ps_front = part_system_create_layer("Main", false);
		part_system_depth(global.ps_front, -1);
	}else{
		if (part_system_get_layer(global.ps_front) != "Main"){
			part_system_layer(global.ps_front, "Main");
			part_system_depth(global.ps_front, -1);
		}
	}

	if (!part_system_exists(global.ps_bottom)){
		global.ps_bottom = part_system_create_layer("PartBottom", false);
	}else{
		if (part_system_get_layer(global.ps_bottom) != "PartBottom"){
			part_system_layer(global.ps_bottom, "PartBottom");
		}
	}
	
	part = 20;
}