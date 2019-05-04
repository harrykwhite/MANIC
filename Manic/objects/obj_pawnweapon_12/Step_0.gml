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
		attack_time --;
	}
	
    if (attack) && (attack_time <= 0){
	    var xpos = x + lengthdir_x(14 * owner.scale, dir) + lengthdir_x(3, up(dir));
		var ypos = y + lengthdir_y(14 * owner.scale, dir) + lengthdir_y(3, up(dir));
		var isEnemy = true;
		
		scr_sound_play(snd_weapon_shoot_0, false, 0.8, 1.2);
		scr_effect_screenshake(2);
		angle_offset = 8;
		
		part_type_direction(global.pt_flash_0, dir - 17, dir + 17, 0, 0);
		part_particles_create(global.ps_front, xpos + random_range(-3, 3), ypos + random_range(-3, 3), global.pt_flash_0, 2);
		part_type_direction(global.pt_smoke_5, dir - 17, dir + 17, 0, 0);
		part_particles_create(global.ps_front, xpos + lengthdir_x(3, dir) + random_range(-3, 3), ypos + lengthdir_y(3, dir) + random_range(-3, 3), global.pt_smoke_5, 2);
		
		if (owner.pawn == PawnType.Companion){
			isEnemy = false;
		}
		
		shoot = instance_create(xpos, ypos, obj_proj_0);
		shoot.damage = 1;
		shoot.strength = 1;
		shoot.dir = dir + random_range(-1, 1);
		shoot.spd = 14;
		shoot.image_angle = shoot.dir;
		shoot.enemy = isEnemy;
		shoot.creator = owner;
		
	    owner.knockback_speed = -1;
	    owner.knockback_direction = dir;
		attack_time = attack_time_max;
    }
}