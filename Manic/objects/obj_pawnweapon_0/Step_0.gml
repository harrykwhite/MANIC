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
		
		scr_weapon_melee_detect(isEnemy, x, y, dir, scr_pawn_weapon_damage(0), 1.5, 35, obj_proj_1, owner.x, owner.y);
		
        owner.knockback_speed = 1;
        owner.knockback_direction = dir;
		
        attack = false;
        attack_time = attack_time_max;
		
        angle_offset = -angle_offset;
    }
}

// Burn
if (burn){
	if (burn_time > 0){
		burn_time --;
	}else{
		kill = true;
	}
	
	if (!global.game_pause){
		var lenp = random_range(7, 25);
		var lenop = random(3) * choose(-1, 1);
		var xp = x + lengthdir_x(lenp, image_angle);
		var yp = y + lengthdir_y(lenp, image_angle);
		xp += lengthdir_x(lenop, image_angle + 90);
		yp += lengthdir_y(lenop, image_angle + 90);
		
		if (random(3) < 1){
			part_particles_create(global.ps_front, xp, yp, global.pt_fire_0, 1);
		}
		
		if (random(5) < 1){
			part_particles_create(global.ps_front, xp, yp, global.pt_fire_2, 1);
		}
	}
}else{
	burn_time = burn_time_max;
}