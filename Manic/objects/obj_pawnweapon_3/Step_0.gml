if (global.game_pause){
	image_speed = 0;
	return;
}

alpha = approach(alpha, alphaTo, 40);
image_alpha = alpha;

// Attacking
if (instance_exists(owner)){

    alphaTo = 1;
    
    if (attack_time > 0){
        attack_time--;
    }
    
    if (attack) && (attack_time <= 0){
        scr_effect_screenshake(1);
        scr_sound_play_distance(snd_weapon_swing_0, false, 450);
        
	    var xpos = x + lengthdir_x(28 * owner.scale, dir);
	    var ypos = y + lengthdir_y(28 * owner.scale, dir);
		var isEnemy = true;
		
	    proj = instance_create(xpos, ypos, obj_proj_3);
	    proj.image_angle = dir;
	    proj.depth = depth + 1;
		proj.creator = owner;
	    
		if (owner.pawn == PawnType.Companion){
			isEnemy = false;
		}
		
		scr_weapon_melee_detect(isEnemy, x, y, dir, scr_pawn_weapon_damage(0), 2, 32 + 8, obj_proj_3);
        
        owner.knockback_speed = -2;
        owner.knockback_direction = dir;
		
        attack = false;
        attack_time = attack_time_max;
		
        attack_active = true;
    }
}

