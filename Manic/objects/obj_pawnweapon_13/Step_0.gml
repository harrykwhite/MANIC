if (global.game_pause){
	image_speed = 0;
	return;
}

// Attacking
if (instance_exists(owner)){
    if (attack_time > 0){
        attack_time--;
    }

    if (attack) && (attack_time <= 0){
        scr_effect_screenshake(1);
        scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
        
	    var xpos = owner.x + lengthdir_x(42 * owner.scale, dir);
		var ypos = owner.y + lengthdir_y(42 * owner.scale, dir);
		var isEnemy = true;
		
	    proj = instance_create(xpos, ypos, obj_proj_2);
	    proj.image_angle = dir;
	    proj.depth = depth + 1;
		proj.creator = owner;
		proj.owner_inst = owner;
		proj.owner_offset_x = proj.x - proj.owner_inst.x;
		proj.owner_offset_y = proj.y - proj.owner_inst.y;
		
		if (owner.pawn == PawnType.Companion){
			isEnemy = false;
		}
	    
		scr_weapon_melee_detect(isEnemy, owner.x, owner.y, dir, scr_pawn_weapon_damage(0), 0.05, 42, obj_proj_2, owner.x, owner.y);
        
        owner.knockback_speed = -1;
        owner.knockback_direction = dir;
		
        attack = false;
        attack_time = attack_time_max;
		
        angle_offset = -angle_offset;
    }
}

