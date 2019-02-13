if (instance_exists(owner)){
	if (scr_pawn_weapon_endstepcan()){
		dir = dir + (owner.image_xscale * throw_offset);
		
	    x = (owner.x + (-3 * owner.image_xscale)) + lengthdir_x(14 * owner.scale, owner.arm.image_angle);
	    y = (owner.y - 4) + lengthdir_y(14 * owner.scale, owner.arm.image_angle);
		
		image_angle = dir;
	
	    if (image_angle < 90) || (image_angle > 270){
	        image_yscale = 1;
	    }else{
	        image_yscale = -1;
	    }
    
	    if (angle_offset > 0){
	        angle_offset -= 0.2;
	    }else{
	        angle_offset = 0;
	    }
	}
}

