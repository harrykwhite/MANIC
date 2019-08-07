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
        scr_effect_screenshake(2);
        scr_sound_play_distance(snd_weapon_swing_0, false, 450);
        
	    var xpos = x + lengthdir_x(50 * owner.scale, dir);
	    var ypos = y + lengthdir_y(50 * owner.scale, dir);
		var isEnemy = true;
		
	    proj = instance_create(xpos, ypos, obj_proj_2);
	    proj.image_angle = dir;
	    proj.depth = depth + 1;
		proj.creator = owner;
		
		if (owner.pawn == PawnType.Companion){
			isEnemy = false;
		}
		
		scr_weapon_melee_detect(isEnemy, x, y, dir, scr_pawn_weapon_damage(1), 2.85, 53, obj_proj_2, owner.x, owner.y);
        
        owner.knockback_speed = -2;
        owner.knockback_direction = dir;
		
        attack = false;
        attack_time = attack_time_max;
        attack_active = true;
		attack_return = false;
    }
}