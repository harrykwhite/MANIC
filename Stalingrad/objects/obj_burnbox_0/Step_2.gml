if (owner != noone){
	if (instance_exists(owner)){
		x = owner.x;
		y = owner.y;
		
		if (owner.burn == false){
			instance_destroy();
		}
		
	}else{
		instance_destroy();
	}
}