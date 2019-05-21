if (instance_exists(owner)){
	if (scr_pawn_weapon_endstepcan()){
		dir = dir + (sign(owner.image_xscale) * throw_offset);
		
	    x = owner.arm.x + lengthdir_x(14 * owner.scale, owner.arm.image_angle);
	    y = owner.arm.y + lengthdir_y(14 * owner.scale, owner.arm.image_angle);
		
		image_angle = dir;
		image_yscale = sign(owner.image_xscale);
    
	    if (angle_offset > 0){
	        angle_offset -= 0.2;
	    }else{
	        angle_offset = 0;
	    }
	}
}

