if (scr_pawn_weapon_endstepcan()){
	if (instance_exists(owner)){
		dir = dir + (sign(owner.image_xscale) * throw_offset);
		x = owner.arm.x + lengthdir_x(6 * owner.scale, dir);
		y = owner.arm.y + lengthdir_y(6 * owner.scale, dir);
	
		image_angle = dir;
		
		if (image_angle > 270 || image_angle <= 90){
			image_yscale = 1;
		}else{
			image_yscale = -1;
		}
	}

	if (attack_active){
	    if (!attack_return){
	        if (attack_offset < 8){
	            attack_offset ++;
	        }else{
	            attack_return = true;
	        }
	    }else{
	        if (attack_offset > 0){
	            attack_offset --;
	        }else{
	            attack_offset = 0;
	            attack_active = false;
	            attack_return = false;
	        }
	    }
	}
}