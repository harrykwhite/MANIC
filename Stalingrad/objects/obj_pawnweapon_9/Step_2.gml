if (scr_pawn_weapon_endstepcan()){
	if (instance_exists(owner)){
		dir = dir + (owner.image_xscale * throw_offset);
	    x = (owner.x + (-3 * owner.image_xscale)) + lengthdir_x(6 * owner.scale, dir);
	    y = (owner.y - 4) + lengthdir_y(6 * owner.scale, dir);
	
	    image_angle = dir;
		image_yscale = 1;
	}

	if (attack_active){
	
	    if (attack_return == false){
	        if (attack_offset < 8){
	            attack_offset += 2;
	        }else{
	            attack_return = true;
	        }
        
	    }else{
	        if (attack_offset > 0){
	            attack_offset -= 2;
	        }else{
	            attack_offset = 0;
	            attack_active = false;
	            attack_return = false;
	        }
	    }
	}
}