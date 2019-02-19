if (instance_exists(global.player)){
	if (use_current){
        // Positioning
		if (!global.game_pause){
			var mdir = point_direction(global.player.x, global.player.y, mouse_x, mouse_y);
    
		    if (instance_exists(obj_player_arm)){
		        x = obj_player_arm.x + lengthdir_x(20 + shoot_bounceback, image_angle);
		        y = obj_player_arm.y + lengthdir_y(20 + shoot_bounceback, image_angle);
		    }
	        image_angle = mdir;
		
			// Bounce Back
			x += lengthdir_x(shoot_bounceback, image_angle);
			y += lengthdir_y(shoot_bounceback, image_angle);
			shoot_bounceback = approach(shoot_bounceback, 0, 20);
		
	        // Direction
	        if (mouse_x > x){
	            image_yscale = 1;
	        }else{
	            image_yscale = -1;
	        }
		}
        
        if (global.cutscene_current != -1){
            shoot_can = false;
        }
    }else{
		if (cart != noone){
			x = cart.x + 15;
			y = cart.y + 6;
			image_angle = 90;
			image_yscale = -1;
		}
	}
}else{
	ammo = -1;
	global.weapon_slotammo[global.weapon_slotcurrent] = global.weapon_ammomax[index];
	use_current = false;
	shoot_can = false;
	use_can_stop = false;
}

