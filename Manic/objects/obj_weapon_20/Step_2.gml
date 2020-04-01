if (!instance_exists(obj_player)) || (instance_number(object_index) > 1){
    instance_destroy();

}else{
	
    if (sign(obj_player.image_xscale) == 1){
        image_yscale = 1;
    }else{
        image_yscale = -1;
    }
}

if (instance_exists(obj_player)){
    
    // Position
	if (!global.game_pause){
	    var mdir = point_direction(global.player_position_x, global.player_position_y, scr_input_get_mouse_x(), scr_input_get_mouse_y());
	    shoot_bounceback = approach(shoot_bounceback, 0, 20);
    
	    if (instance_exists(obj_player_arm)){
	        x = obj_player_arm.x + lengthdir_x(7 + shoot_bounceback, image_angle);
	        y = obj_player_arm.y + lengthdir_y(7 + shoot_bounceback, image_angle);
			image_alpha = obj_player_arm.image_alpha;
		}
		
	    if (angle_offset > 0){
	        angle_offset --;
	    }else if (angle_offset < 0){
	        angle_offset ++;
	    }
		
		// Throw Offset
	    if (sign(image_yscale) == 1){
	        image_angle = mdir + angle_offset;
	    }else{
	        image_angle = mdir - angle_offset;
	    }
	}
}

