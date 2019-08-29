var mdir;

if (instance_exists(obj_player)){
	mdir = point_direction(obj_player.x, obj_player.y, scr_input_get_mouse_x(), scr_input_get_mouse_y());
	
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
	        if (scr_input_get_mouse_x() > x){
	            image_yscale = 1;
	        }else{
	            image_yscale = -1;
	        }
		}
        
        if (global.cutscene_current != -1){
            shoot_can = false;
        }
    }
}else{
	ammo = -1;
	global.weapon_slotammo[global.weapon_slotcurrent] = global.weapon_ammomax[index];
	use_current = false;
	shoot_can = false;
	use_can_stop = false;
}

