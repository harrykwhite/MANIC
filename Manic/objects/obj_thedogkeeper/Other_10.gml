scr_pre_draw_attributes_pawn();
draw_self();
scr_draw_attributes_pawn();

var counter = 0;
dogs_alive = 3;

if (arm != -1){
	if (instance_exists(arm)){
		dogs_downed = true;
		
		repeat(dog_count){
			var thisdog = dog[counter];
			
			if (instance_exists(thisdog)){
				var dir = point_direction(arm.x + lengthdir_x(11, move_dir), arm.y + lengthdir_y(11, move_dir), thisdog.x + (6 * thisdog.image_xscale), thisdog.y + 4);
				var dist = point_distance(arm.x + lengthdir_x(11, move_dir), arm.y + lengthdir_y(11, move_dir), thisdog.x + (6 * thisdog.image_xscale), thisdog.y + 4);
				var spritecount = dist div 6;
				var spritecounter = 0;
				
				repeat(spritecount){
					draw_sprite_ext(spr_thedogkeeper_lead_0, 0, arm.x + lengthdir_x(11, move_dir) + lengthdir_x(6 * spritecounter, dir), arm.y + lengthdir_y(11, move_dir) + lengthdir_y(6 * spritecounter, dir), 1, 1, dir, c_white, 1);
					spritecounter ++;
				}
				
				dogs_downed = false;
			}else{
				dogs_alive --;
			}
			
			counter ++;
		}
	}
}