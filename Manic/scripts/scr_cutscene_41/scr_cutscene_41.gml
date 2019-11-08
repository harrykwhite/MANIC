///scr_cutscene_41();
var index = 41;

obj_controller_camera.camera_screenshake = false;
obj_controller_camera.camera_screenshake_amount = 0;

if (instance_exists(obj_player)){
	var anvil = instance_nearest(obj_player.x, obj_player.y, obj_anvil_0);
	
	if (anvil != noone){
		global.cutscene_camera_x[index] = anvil.x;
		global.cutscene_camera_y[index] = anvil.y;
		
		if (global.cutscene_time[index] < 220){
			global.cutscene_time[index] ++;
		
			if (global.cutscene_time[index] > 105){
				with(obj_ef_armour_piece){
					x_to = anvil.x;
				}
			
				if (!instance_exists(obj_ef_armour_full)){
					var list = ds_list_create();
					var count = collision_point_list(anvil.x, anvil.y - 30, obj_ef_armour_piece, false, true, list, false);
			
					if (count >= 4){
						with(obj_ef_armour_piece){
							instance_destroy();
						}
				
						var full = instance_create(anvil.x, anvil.y - 30, obj_ef_armour_full);
						full.flash = 6;
					}
			
					ds_list_destroy(list);
				}else{
					if (global.cutscene_time[index] > 160){
						obj_ef_armour_full.x_to = obj_player.x;
						obj_ef_armour_full.y_to = obj_player.y;
						obj_ef_armour_full.can_touch_player = true;
					}
				}
			}else{
				if (!instance_exists(obj_ef_armour_piece)) && (!instance_exists(obj_ef_armour_full)){
					var piece;
					
					// Chestplate
					piece = instance_create(obj_player.x, obj_player.y, obj_ef_armour_piece);
					piece.sprite_index = spr_collectable_chestplate_piece_0;
					piece.x_to = anvil.x - 30;
					piece.y_to = anvil.y - 50;
			
					piece = instance_create(obj_player.x, obj_player.y, obj_ef_armour_piece);
					piece.sprite_index = spr_collectable_chestplate_piece_1;
					piece.x_to = anvil.x - 15;
					piece.y_to = anvil.y - 50;
			
					piece = instance_create(obj_player.x, obj_player.y, obj_ef_armour_piece);
					piece.sprite_index = spr_collectable_chestplate_piece_2;
					piece.x_to = anvil.x + 15;
					piece.y_to = anvil.y - 50;
			
					piece = instance_create(obj_player.x, obj_player.y, obj_ef_armour_piece);
					piece.sprite_index = spr_collectable_chestplate_piece_3;
					piece.x_to = anvil.x + 30;
					piece.y_to = anvil.y - 50;
					
					// Leggings
					piece = instance_create(obj_player.x, obj_player.y, obj_ef_armour_piece);
					piece.sprite_index = spr_collectable_leggings_piece_0;
					piece.x_to = anvil.x - 22;
					piece.y_to = anvil.y - 30;
					
					piece = instance_create(obj_player.x, obj_player.y, obj_ef_armour_piece);
					piece.sprite_index = spr_collectable_leggings_piece_1;
					piece.x_to = anvil.x;
					piece.y_to = anvil.y - 30;
					
					piece = instance_create(obj_player.x, obj_player.y, obj_ef_armour_piece);
					piece.sprite_index = spr_collectable_leggings_piece_2;
					piece.x_to = anvil.x + 22;
					piece.y_to = anvil.y - 30;
				}
			}
		}else{
			if (instance_exists(obj_ef_armour_piece)){
				instance_destroy(obj_ef_armour_piece);
			}
		
			if (instance_exists(obj_ef_armour_full)){
				instance_destroy(obj_ef_armour_full);
			}
		
			global.cutscene_current = -1;
			global.cutscene_time[index] = 0;
		}
	}
}else{
	global.cutscene_current = -1;
	global.cutscene_time[index] = 0;
}