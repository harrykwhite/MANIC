if (!instance_exists(obj_player)) || (instance_number(object_index) > 1){
    instance_destroy();
}else{
    if (sign(obj_player.image_xscale) == 1){
        image_yscale = 1;
    }else{
        image_yscale = -1;
    }
}

// Positioning and Visibility
if (instance_exists(obj_player)){
    
    // Position
	if (!global.game_pause){
	    // Arm
	    if (instance_exists(obj_player_arm)){
	        obj_player_arm.x = obj_player_arm.x + lengthdir_x(attack_offset, image_angle);
	        obj_player_arm.y = obj_player_arm.y + lengthdir_y(attack_offset, image_angle);
			
			image_alpha = obj_player_arm.image_alpha;
			image_angle = point_direction(obj_player.x, obj_player.y, scr_input_get_mouse_x(), scr_input_get_mouse_y());
		    
			x = obj_player_arm.x + lengthdir_x(attack_offset + 12, image_angle);
		    y = obj_player_arm.y + lengthdir_y(attack_offset + 12, image_angle);
		}
		
		if (start_offset > 0){
			start_offset = approach(start_offset, 0, 40);
		}
		
	    if (scr_input_get_mouse_x() > global.player_position_x){
	        image_yscale = 1;
			image_angle += start_offset;
	    }else{
	        image_yscale = -1;
			image_angle -= start_offset;
	    }
	}
}

