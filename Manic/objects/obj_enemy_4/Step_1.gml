if (!flies_created){
	repeat(6){
		var fly = instance_create(x + random_range(-20, 20), y + random_range(-10, 10), obj_enemy_1);
		fly.owner = id;
	}
	
	flies_created = true;
}