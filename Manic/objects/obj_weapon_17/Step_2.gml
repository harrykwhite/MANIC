var mdir;

if (instance_exists(obj_player)){
	mdir = point_direction(obj_player_arm.x, obj_player_arm.y, scr_input_get_mouse_x(), scr_input_get_mouse_y());
	
	if (use_current){
		
		// Stand
		stand = instance_nearest(x, y, obj_weapon_17_stand);
		
        // Positioning
		if (!global.game_pause){
	        image_angle = mdir;
	        var xpos = stand.x - lengthdir_x(13, mdir);
	        var ypos = (stand.y + 2) - lengthdir_y(13, mdir);
	        obj_player.x = xpos;
			obj_player.y = ypos;
		
			// Bounce Back
			x = stand.x + lengthdir_x(shoot_bounceback, image_angle);
			y = stand.y + lengthdir_y(shoot_bounceback, image_angle);
			shoot_bounceback = approach(shoot_bounceback, 0, 20);
		
	        // Direction
	        if (scr_input_get_mouse_x() > global.player_position_x){
	            image_yscale = 1;
	        }else{
	            image_yscale = -1;
	        }
		}
        
        if (global.cutscene_current != -1){
            shoot_can = false;
        }
		
		obj_controller_ui.weapon_standalone_ammox = x;
		obj_controller_ui.weapon_standalone_ammoy = y + 17;
    }
}else{
	use_current = false;
	shoot_can = false;
	use_can_stop = false;
}