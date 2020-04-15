if (instance_exists(owner)){
	if (scr_pawn_weapon_endstepcan()){
		dir = dir + (sign(owner.image_xscale) * throw_offset);
	    x = owner.arm.x + lengthdir_x(12 * owner.scale, dir);
	    y = owner.arm.y + lengthdir_y(12 * owner.scale, dir);
	
	    image_angle = dir + angle_offset_current;
	
		if (angle_offset_current < 0){
			image_yscale = 1;
		}else{
			image_yscale = -1;
		}
	
		angle_offset_current = approach(angle_offset_current, angle_offset, 50);
	}
	
	// Kill
	if (kill){
		instance_destroy();
		
		owner.weapon = instance_create(x, y, obj_pawnweapon_3);
		owner.weapon.owner = owner;
		owner.weapon_index = PawnWeapon.Knife;
		
		scr_effect_screenshake(3);
		scr_effect_freeze(13);
		scr_sound_play(snd_weapon_stick_break_0, false, 0.8, 1.2);
		
		var sticklen = 20, thislen = 1;
		repeat(sticklen){
			part_particles_create(global.ps_bottom, x + lengthdir_x(thislen, image_angle), y + lengthdir_y(thislen, image_angle), global.pt_stick_break_0, 1);
			part_particles_create(global.ps_bottom, x + lengthdir_x(thislen, image_angle), y + lengthdir_y(thislen, image_angle), global.pt_stick_break_flash_0, 1);
			thislen ++;
		}
	}
}