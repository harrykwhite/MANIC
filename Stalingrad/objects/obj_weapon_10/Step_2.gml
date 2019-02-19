if (instance_exists(global.player)==false) || (instance_number(object_index)>1){
    instance_destroy();
}else{
    if (global.player.image_xscale == 1){
        image_yscale = 1;
    }else{
        image_yscale = -1;
    }
}

// Positioning and Visibility
if (instance_exists(global.player)){
    
    // Position
	if (global.game_pause == false){
	    image_angle = point_direction(global.player.x, global.player.y, mouse_x, mouse_y) + attack_range_current;
	    x = obj_player_arm.x + lengthdir_x(attack_offset + 3, image_angle);
	    y = obj_player_arm.y + lengthdir_y(attack_offset + 3, image_angle);
    
	    if (mouse_x > x){
	        image_yscale = 1;
	    }else{
	        image_yscale = -1;
	    }
    
	    // Arm
	    if (instance_exists(obj_player_arm)){
	        obj_player_arm.x = obj_player_arm.x + lengthdir_x(attack_offset, image_angle);
	        obj_player_arm.y = obj_player_arm.y + lengthdir_y(attack_offset, image_angle);
	    }
	}
    
    if (global.player.state == scr_player_dash) || (global.cutscene_current != -1){
        if (visible ){
            fade_out = true;
        }
        
        attack_can = false;
        
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

