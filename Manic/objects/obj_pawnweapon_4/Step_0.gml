if (global.game_pause){
	image_speed = 0;
	return;
}

// Attacking
if (attack_time > 0){
    attack_time--;
}

if (instance_exists(owner)) && (!global.game_pause){
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
			throw.timemax = 80;
	        throw.angle = image_angle;
			throw.throw_offset = throw_offset;
			throw.damage_enemy = true;
			throw.damage_player = true;
			throw.damage_companion = dCompanion;
			throw.creator = owner;
			throw.dir = owner.arm.image_angle;
			
			owner.weapon = instance_create(x, y, obj_pawnweapon_3);
	        owner.weapon.owner = owner;
	        owner.weapon_index = PawnWeapon.Knife;
	    }
	}
}