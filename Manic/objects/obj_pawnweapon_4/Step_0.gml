if (global.game_pause){
	image_speed = 0;
	return;
}

// Attacking
if (attack_time > 0){
    attack_time--;
}

if (instance_exists(owner)){
    if (attack){
		if (throw_offset < 40){
			throw_offset ++;
		}else{
	        scr_effect_screenshake(1);       
	        instance_destroy();
			var dCompanion = true;
			
			if (owner.pawn == PawnType.Companion){
				dCompanion = false;
			}
			
	        throw = instance_create(x, y, obj_throwobject_1);
	        throw.spd = 9;
	        throw.damage = 3;
			throw.timemax = 65;
	        throw.image_angle = image_angle;
			throw.throw_offset = throw_offset;
			throw.damage_enemy = true;
			throw.damage_player = dCompanion;
			throw.damage_companion = dCompanion;
			throw.creator = owner;
			
			if (owner.pawn == PawnType.Companion){
				if (owner.target != noone) && (instance_exists(owner.target)){
					throw.dir = point_direction(x, y, owner.target.x, owner.target.y);
				}else{
					throw.dir = dir - (sign(owner.image_xscale) * throw_offset);
				}
			}else{
				if (instance_exists(obj_player)){
					throw.dir = point_direction(x, y, obj_player.x, obj_player.y);
				}else{
					throw.dir = dir - (sign(owner.image_xscale) * throw_offset);
				}
			}
			
			owner.weapon = instance_create(x, y, obj_pawnweapon_3);
	        owner.weapon.owner = owner;
	        owner.weapon_index = PawnWeapon.Knife;
	    }
	}
}

