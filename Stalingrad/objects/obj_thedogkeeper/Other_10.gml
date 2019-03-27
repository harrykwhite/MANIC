draw_self();
scr_draw_attributes_pawn();

var counter = 0, spritecounter = 0, hpcur = 0, hpmax = 0;
dogs_alive = 1;

hpcur += health_current;
hpmax += health_max;

if (arm != -1){
	if (instance_exists(arm)){
		dogs_downed = true;
		dogs_alive = 1;
		
		repeat(dog_count){
			var thisdog = dog[counter];
			
			if (instance_exists(thisdog)){
				var dir = point_direction(arm.x + lengthdir_x(9, move_dir), arm.y + lengthdir_y(9, move_dir), thisdog.x + (6 * thisdog.image_xscale), thisdog.y + 4);
				var dist = point_distance(arm.x + lengthdir_x(9, move_dir), arm.y + lengthdir_y(9, move_dir), thisdog.x + (6 * thisdog.image_xscale), thisdog.y + 4);
				var spritecount = dist div 6;
				
				repeat(spritecount){
					draw_sprite_ext(spr_thedogkeeper_lead_0, 0, arm.x + lengthdir_x(9, move_dir) + lengthdir_x(6 * sp, dir), arm.y + lengthdir_y(9, move_dir) + lengthdir_y(6 * sp, dir), 1, 1, dir, c_white, 1);
					spritecounter ++;
				}
				
				hpcur += thisdog.health_current;
				hpmax += thisdog.health_max;
				
				dogs_downed = false;
				dogs_alive ++;
			}
			
			counter ++;
		}
	}
}