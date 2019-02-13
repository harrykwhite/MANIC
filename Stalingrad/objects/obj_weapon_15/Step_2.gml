if (instance_exists(global.player)==false) || (instance_number(object_index)>1){
    instance_destroy();
}else{
	
    if (global.player.image_xscale == 1){
        image_yscale = 1;
    }else{
        image_yscale = -1;
    }
}

// Positioning
if (instance_exists(global.player)){
    
    // Position
	if (global.game_pause == false){
	    var mdir = point_direction(global.player.x, global.player.y, mouse_x, mouse_y);
    
	    if (instance_exists(obj_player_arm)){
	        x = obj_player_arm.x + lengthdir_x(7 + shoot_bounceback, image_angle);
	        y = obj_player_arm.y + lengthdir_y(7 + shoot_bounceback, image_angle);
	    }
    
	    shoot_bounceback = approach(shoot_bounceback, 0, 20);
    
	    if (angle_offset > 0){
	        angle_offset -= 1;
	    }else if (angle_offset < 0){
	        angle_offset ++;
	    }
    
	    // Direction
	    if (image_yscale == 1){
	        image_angle = mdir + angle_offset;
	    }else{
	        image_angle = mdir - angle_offset;
	    }
        
	    if (mouse_x > x){
	        image_yscale = 1;
	    }else{
	        image_yscale = -1;
	    }
	}
    
    if (global.player.state == scr_player_dash) || (global.cutscene_current != -1){
        if (visible == true){
            fade_out = true;
        }
        
        shoot_can = false;
        throw_time = 0;
        
    }else if (visible == false){
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

