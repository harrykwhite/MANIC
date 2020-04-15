if (instance_exists(owner)){
	if (scr_pawn_weapon_endstepcan()){
		dir = dir + (sign(owner.image_xscale) * throw_offset);
	    x = owner.arm.x + lengthdir_x(7 * owner.scale, dir) + lengthdir_x(1 * owner.scale, up(dir));
	    y = owner.arm.y + lengthdir_y(7 * owner.scale, dir) + lengthdir_y(1 * owner.scale, up(dir));
		
	    image_angle = dir + (angle_offset * owner.image_xscale);
		image_angle %= 360;
		
		while(image_angle < 0){
			image_angle += 360;
		}
		
		if (image_angle > 270 || image_angle <= 90){
			image_yscale = 1;
		}else{
			image_yscale = -1;
		}
		
		if (angle_offset > 0){
			angle_offset -= 0.15;
		}
	}
}