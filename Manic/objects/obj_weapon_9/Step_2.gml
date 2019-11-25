if (!instance_exists(obj_player)) || (instance_number(object_index) > 1){
    instance_destroy();
}else{
    if (sign(obj_player.image_xscale) == 1){
        image_yscale = 1;
    }else{
        image_yscale = -1;
    }
}

// Positioning
if (instance_exists(obj_player)){
    
    // Position
	if (!global.game_pause){
	    var mdir = point_direction(global.player_position_x, global.player_position_y, scr_input_get_mouse_x(), scr_input_get_mouse_y());
		
	    if (instance_exists(obj_player_arm)){
	        x = obj_player_arm.x + lengthdir_x(14, image_angle);
	        y = obj_player_arm.y + lengthdir_y(14, image_angle);
			image_alpha = obj_player_arm.image_alpha;
		}
		
	    if (angle_offset > 0){
	        angle_offset --;
	    }else if (angle_offset < 0){
	        angle_offset ++;
	    }
		
		if (start_offset > 0){
			start_offset = approach(start_offset, 0, 40);
		}
    
	    // Direction
	    if (sign(image_yscale) == 1){
	        image_angle = (mdir + throw_offset) + angle_offset + start_offset;
	    }else{
	        image_angle = (mdir - throw_offset) - angle_offset - start_offset;
	    }
        
	    if (scr_input_get_mouse_x() > global.player_position_x){
	        image_yscale = 1;
	    }else{
	        image_yscale = -1;
	    }
    
	    if (throw_time > 0){
	        if (throw_offset < 60){
	            throw_offset += 4;
	        }
	    }else{
	        if (throw_offset > 0){
	            throw_offset -= 5;
	        }else{
	            throw_offset = 0;
	        }
	    }
	}
}

