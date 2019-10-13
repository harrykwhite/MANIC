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
        
	    var xpos = x + lengthdir_x(35 * owner.scale, dir);
		var ypos = y + lengthdir_y(35 * owner.scale, dir);
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
	    
		scr_weapon_melee_detect(isEnemy, x, y, dir, scr_pawn_weapon_damage(0), 1, 35, obj_proj_2, owner.x, owner.y);
        
        owner.knockback_speed = -1;
        owner.knockback_direction = dir;
		
        attack = false;
        attack_time = attack_time_max;
		
        angle_offset = -angle_offset;
		
		if (owner.type == Enemy0_Type.TrainBoss){
			with(owner){
				if (sniperboss_attack_counter < 4){
					sniperboss_attack_counter ++;
				}else{
					sniperboss_attack_counter = 0;
					sniperboss_melee = false;
					instance_destroy(weapon);
					
					weapon = instance_create(x, y, obj_pawnweapon_8);
					weapon.dir = 0;
					weapon.owner = id;
					weapon.attack_time = 210;
					weapon.line_alpha = -(4.96 * (210 / 340));
					weapon_index = 8;
				}
			}
		}
    }
}

