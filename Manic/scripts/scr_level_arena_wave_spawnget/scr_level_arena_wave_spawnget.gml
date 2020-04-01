///@param xpos
///@param ypos
var xpos = argument0;
var ypos = argument1;
var weapon = -1, enemy = noone;
var wavecurrent = global.game_combat_arena_wave;

switch(room){
	case rm_arena_1_00:
		if (chance(85 - wavecurrent)){
			enemy = instance_create(xpos, ypos, obj_enemy_0);
			
			if (chance(90)){
				weapon = choose(PawnWeapon.Crowbar, PawnWeapon.Axe);
			}else{
				weapon = PawnWeapon.Knife;
			}
			
			if (wavecurrent >= 2){
				if (global.boss_current == -1){
					if (chance(5)){
						enemy.type = Enemy0_Type.Mother;
					}
				}
			}
		}else{
			enemy = instance_create(xpos, ypos, obj_enemy_2);
		}
		break;
}

if (enemy != noone){
	if (enemy.object_index == obj_enemy_0){
		if (global.game_combat_in_hordechallenge){
			enemy.type = Enemy0_Type.Normal;
		}

		if (weapon == PawnWeapon.Grenade){
			enemy.type = Enemy0_Type.Grenadier;
		}

		if (enemy.type == Enemy0_Type.Sniper){
			weapon = PawnWeapon.SniperRifle;
		}
		
		enemy.weapon_index = weapon;
	}
}

return enemy;