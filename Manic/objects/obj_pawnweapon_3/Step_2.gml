if (instance_exists(owner)){
	if (scr_pawn_weapon_endstepcan()){
		dir = dir + (sign(owner.image_xscale) * throw_offset);
	    x = owner.arm.x + lengthdir_x(11 * owner.scale, dir);
	    y = (owner.y - (4 * owner.scale)) + lengthdir_y(11 * owner.scale, dir);
	
	    image_angle = dir;
		image_yscale = sign(owner.image_xscale);
		
		if (throw_offset > 0){
			throw_offset --;
		}
	}
}