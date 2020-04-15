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
        scr_effect_screenshake(3);
        scr_sound_play(snd_weapon_swing_0, false, 0.8, 1.2);
        
	    var xpos = x + lengthdir_x(35 * owner.scale, dir);
	    var ypos = y + lengthdir_y(35 * owner.scale, dir);
		var isEnemy = true;

	    proj = instance_create(xpos, ypos, obj_proj_1);
	    proj.image_angle = dir;
	    proj.depth = depth + 1;
		proj.creator = owner;
		proj.owner_inst = owner;
		proj.owner_offset_x = proj.x - proj.owner_inst.x;
		proj.owner_offset_y = proj.y - proj.owner_inst.y;
		
		if (owner.pawn == PawnType.Companion){
			isEnemy = false;
		}
		
	    scr_weapon_melee_detect(isEnemy, x, y, dir, scr_pawn_weapon_damage(1), 2.75, 35, obj_proj_1, owner.x, owner.y);
        
        owner.knockback_speed = 0.6;
        owner.knockback_direction = dir;
		
        attack = false;
        attack_time = attack_time_max;
		
        angle_offset = -angle_offset;
    }
}