if (!instance_exists(obj_player)) || (instance_number(object_index) > 1){
    instance_destroy();
}else{
    if (obj_player.image_xscale == 1){
        image_yscale = 1;
    }else{
        image_yscale = -1;
    }
}

// Positioning and Visibility
if (instance_exists(obj_player)){
    
    // Position
	if (!global.game_pause){
	    image_angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y) + attack_range_current;
	    x = obj_player_arm.x + lengthdir_x(attack_offset + 3, image_angle);
	    y = obj_player_arm.y + lengthdir_y(attack_offset + 3, image_angle);
		
		if (start_offset > 0){
			start_offset = approach(start_offset, 0, 40);
		}
		
	    if (mouse_x > x){
	        image_yscale = 1;
			image_angle += start_offset;
	    }else{
	        image_yscale = -1;
			image_angle -= start_offset;
	    }
    
	    // Arm
	    if (instance_exists(obj_player_arm)){
	        obj_player_arm.x = obj_player_arm.x + lengthdir_x(attack_offset, image_angle);
	        obj_player_arm.y = obj_player_arm.y + lengthdir_y(attack_offset, image_angle);
	    }
	}
    
    if (obj_player.state == scr_player_dash) || (global.cutscene_current != -1){
        if (visible){
            fade_out = true;
        }
        
        attack_can = false;
        
    }else if (!visible){
        fade_in = true;
    }
    
    // Fade Out / In
    if (fade_out){
        if (image_alpha > 0){
            image_alpha -= 0.25;
        }else{
            visible = false;
            fade_out = false;
        }
    }
    
    if (fade_in){
        if (image_alpha < 1){
            image_alpha += 0.25;
        }else{
            visible = true;
            fade_in = false;
        }
    }
}

