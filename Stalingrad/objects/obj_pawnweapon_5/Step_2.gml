if (instance_exists(owner)){
	if (scr_pawn_weapon_endstepcan()){
		dir = dir + (owner.image_xscale * throw_offset);
	    x = (owner.x + (-3 * owner.image_xscale)) + lengthdir_x(14 * owner.scale, dir);
	    y = (owner.y - 4) + lengthdir_y(14 * owner.scale, dir);
	
	    image_angle = dir + angle_offset_current;
	
		if (angle_offset_current < 0){
			image_yscale = 1;
		}else{
			image_yscale = -1;
		}
	
		angle_offset_current = approach(angle_offset_current, angle_offset, 50);
	}
}