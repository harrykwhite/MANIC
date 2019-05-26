if (instance_exists(owner)){
	if (scr_pawn_weapon_endstepcan()){
		dir = dir + (sign(owner.image_xscale) * throw_offset);
	    x = owner.arm.x + lengthdir_x(8 * owner.scale, dir);
	    y = owner.arm.y + lengthdir_y(8 * owner.scale, dir);
	
	    image_angle = dir + (angle_offset * owner.image_xscale);
		image_yscale = sign(owner.image_xscale);
		
		if (angle_offset > 0){
			angle_offset -= 0.15;
		}
	}
}