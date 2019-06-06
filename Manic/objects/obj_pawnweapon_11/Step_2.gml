if (instance_exists(owner)){
	if (scr_pawn_weapon_endstepcan()){
		dir = dir + (sign(owner.image_xscale) * throw_offset);
	    x = owner.arm.x + lengthdir_x(6 * owner.scale, dir) + lengthdir_x(3 * owner.scale, up(dir));
	    y = owner.arm.y + lengthdir_y(6 * owner.scale, dir) + lengthdir_y(3 * owner.scale, up(dir));
		
	    image_angle = dir + (angle_offset * owner.image_xscale);
		image_yscale = sign(owner.image_xscale);
		
		if (angle_offset > 0){
			angle_offset -= 0.15;
		}
	}
}