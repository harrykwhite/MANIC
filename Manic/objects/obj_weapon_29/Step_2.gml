var cart_lock = false;

if (instance_exists(obj_player)){
	if (use_current){
        // Positioning
		if (!global.game_pause){
			var mdir = point_direction(obj_player.x, obj_player.y, scr_input_get_mouse_x(), scr_input_get_mouse_y());
    
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
	        if (scr_input_get_mouse_x() > x){
	            image_yscale = 1;
	        }else{
	            image_yscale = -1;
	        }
		}
        
        if (global.cutscene_current != -1){
            shoot_can = false;
        }
    }else{
		cart_lock = true;
	}
}else{
	ammo = -1;
	global.weapon_slotammo[global.weapon_slotcurrent] = global.weapon_ammomax[index];
	use_current = false;
	shoot_can = false;
	use_can_stop = false;
	cart_lock = true;
}

if (cart_lock){
	if (cart != noone){
		x = cart.x;
		y = cart.y + 6;
		
		if (cart.minecart_dir_clean == 360 || cart.minecart_dir_clean == 0){
			x += 15;
		}else if (cart.minecart_dir_clean == 180){
			x -= 15;
		}
		
		if (cart.minecart_dir_clean == 270){
			y += 10;
		}else if (cart.minecart_dir_clean == 90){
			y -= 10;
		}
		
		image_angle = 90;
		image_yscale = -1;
	}
}