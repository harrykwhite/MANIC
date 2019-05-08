if (instance_exists(owner)){
	if (scr_pawn_weapon_endstepcan()){
		dir = dir + (owner.image_xscale * throw_offset);
	    x = owner.arm.x + lengthdir_x(11 * owner.scale, dir);
	    y = (owner.y - (4 * owner.scale)) + lengthdir_y(11 * owner.scale, dir);
	
	    image_angle = dir;
		
		if (angle_offset_current < 0){
			image_yscale = 1;
		}else{
			image_yscale = -1;
		}
	
		if (throw_offset > 0){
			throw_offset --;
		}
	}
}