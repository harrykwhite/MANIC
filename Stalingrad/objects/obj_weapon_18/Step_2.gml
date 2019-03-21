if (!instance_exists(global.player)) || (instance_number(object_index) > 1){
    instance_destroy();
}else{
    if (global.player.image_xscale == 0.8){
        image_yscale = 0.8;
    }else{
        image_yscale = -0.8;
    }
}

// Positioning
if (instance_exists(global.player)){
    
    // Position
	if (!global.game_pause){
	    var mdir = point_direction(global.player.x, global.player.y, mouse_x, mouse_y);
    
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
        
	    if (mouse_x > x){
	        image_yscale = 0.8;
	    }else{
	        image_yscale = -0.8;
	    }
	}
    
    if (global.player.state == scr_player_dash) || (global.cutscene_current != -1){
        visible = false;
        shoot_can = false;
        throw_time = 0;
    }else{
        visible = true;
    }
}

