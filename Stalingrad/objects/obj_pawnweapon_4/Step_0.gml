if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	image_index = 0;
	exit;
}

alpha = approach(alpha, alphaTo, 40);
image_alpha = alpha;

// Attacking
if (attack_time > 0){
    attack_time--;
}

if (instance_exists(owner)){
    alphaTo = 1;

    if (attack ){
		if (throw_offset < 40){
			throw_offset++;
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
					throw.dir = dir - (owner.image_xscale * throw_offset);
				}
			}else{
				if (instance_exists(global.player)){
					throw.dir = point_direction(x, y, global.player.x, global.player.y);
				}else{
					throw.dir = dir - (owner.image_xscale * throw_offset);
				}
			}
			
			owner.weapon = instance_create(x, y, obj_pawnweapon_3);
	        owner.weapon.owner = owner;
	        owner.weapon_index = 3;
	        owner.throw_complete = true;
	    }
	}
}

