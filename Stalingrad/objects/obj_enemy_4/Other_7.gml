if (mucus_is_releasing){
	if (sprite_index == spr_enemy_4_attack_0){
		if (instance_exists(target)){
			var amount = random_range(4, 5);
			var xx = x + (20 * image_xscale);
			var yy = y + 2;
		
			repeat(amount){
				var mucus = instance_create(xx + random_range(-4, 4), yy + random_range(-4, 4), obj_proj_9);
				mucus.spd = 5;
				mucus.dir = point_direction(x, y, target.x, target.y) + random_range(-10, 10);
				mucus.damage = 1;
				mucus.strength = 0.5;
				mucus.image_angle = mucus.dir;
				mucus.creator = id;
				mucus.enemy = true;
			}
		}
		
		mucus_is_releasing = false;
		sprite_index = spr_enemy_4_idle_0;
	}
}