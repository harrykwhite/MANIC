if (instance_exists(owner)){
	if (scr_pawn_weapon_endstepcan()){
		dir = dir + (owner.image_xscale * throw_offset);
	    x = (owner.x + (-3 * owner.image_xscale)) + lengthdir_x(6 * owner.scale, dir);
	    y = (owner.y - 4) + lengthdir_y(6 * owner.scale, dir);
		
	    image_angle = dir + (angle_offset * owner.image_xscale);
		if (angle_offset > 0){
			angle_offset -= 0.15;
		}
		
		if (dir < 90) || (dir > 270){
			image_yscale = 1;
		}else{
			image_yscale = -1;
		}
	}
}