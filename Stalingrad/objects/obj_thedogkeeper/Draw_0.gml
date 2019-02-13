if (arm != -1){
	if (instance_exists(arm)){
		dogs_downed = true;
		dogs_alive = 1;
		
		for(var i = 0; i < dog_count; i++){
			var thisdog = dog[i];
			
			if (instance_exists(thisdog)){
				var dir = point_direction(arm.x + lengthdir_x(9, move_dir), arm.y + lengthdir_y(9, move_dir), thisdog.x + (6 * thisdog.image_xscale), thisdog.y + 4);
				var dist = point_distance(arm.x + lengthdir_x(9, move_dir), arm.y + lengthdir_y(9, move_dir), thisdog.x + (6 * thisdog.image_xscale), thisdog.y + 4);
				var spritecount = dist / 6;
				
				for(var sp = 0; sp < spritecount; sp++){
					draw_sprite_ext(spr_thedogkeeper_lead_0, 0, arm.x + lengthdir_x(9, move_dir) + lengthdir_x(6 * sp, dir), arm.y + lengthdir_y(9, move_dir) + lengthdir_y(6 * sp, dir), 1, 1, dir, c_white, 1);
				}
				
				dogs_downed = false;
				dogs_alive ++;
			}
		}
	}
}