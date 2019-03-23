if (instance_exists(owner)){
	if (scr_pawn_weapon_endstepcan()){
		dir = dir + (owner.image_xscale * throw_offset);
	    x = (owner.x + (-3 * owner.image_xscale)) + lengthdir_x(11 * owner.scale, owner.arm.image_angle);
	    y = (owner.y - (4 * owner.scale)) + lengthdir_y(11 * owner.scale, dir);
	
	    image_angle = dir;
		image_yscale = 1;
	
		if (throw_offset > 0){
			throw_offset --;
		}
	}
}