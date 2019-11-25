if (!instance_exists(obj_player)) || (instance_number(object_index) > 1){
    instance_destroy();
}else{
    if (obj_player.image_xscale == 0.8){
        image_yscale = 0.8;
    }else{
        image_yscale = -0.8;
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
	    if (image_yscale == -0.8){
	        image_angle = mdir + angle_offset + start_offset;
	    }else{
	        image_angle = mdir - angle_offset - start_offset;
	    }
        
	    if (scr_input_get_mouse_x() > global.player_position_x){
	        image_yscale = 0.8;
	    }else{
	        image_yscale = -0.8;
	    }
	}
    
    if (obj_player.state == scr_player_dash) || (global.cutscene_current != -1){
        visible = false;
        shoot_can = false;
        throw_time = 0;
    }else{
        visible = true;
    }
}

