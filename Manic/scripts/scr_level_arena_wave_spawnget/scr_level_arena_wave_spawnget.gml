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
				if (chance(55 - (wavecurrent * 2))){
					weapon = PawnWeapon.Crowbar;
				}else{
					weapon = choose(PawnWeapon.Axe, PawnWeapon.Rake);
				}
			}else{
				weapon = PawnWeapon.Knife;
			}
			
			if (wavecurrent >= 2){
				if (global.boss_current == -1){
					var motherchance = 3;
					
					if (wavecurrent >= 4){
						motherchance += 2;
					}
					
					if (wavecurrent >= 6){
						motherchance += 2;
					}
					
					if (chance(motherchance)){
						enemy.type = Enemy0_Type.Mother;
					}
				}
			}
		}else{
			enemy = instance_create(xpos, ypos, obj_enemy_2);
		}
		break;
	
	case rm_arena_2_00:
		if (chance(85 - wavecurrent)){
			enemy = instance_create(xpos, ypos, obj_enemy_0);
			
			if (chance(95)){
				if (chance(10 + wavecurrent)){
					weapon = PawnWeapon.Grenade;
				}else{
					weapon = choose(PawnWeapon.Axe, PawnWeapon.Sledgehammer, PawnWeapon.Rake);
				}
			}else{
				weapon = PawnWeapon.Knife;
			}
			
			if (wavecurrent >= 1){
				if (chance(10 + wavecurrent)){
					enemy.type = Enemy0_Type.Crazy;
				}else{
					if (global.boss_current == -1){
						var motherchance = 5;
					
						if (wavecurrent >= 3){
							motherchance += 2;
						}
					
						if (wavecurrent >= 5){
							motherchance += 2;
						}
					
						if (chance(motherchance)){
							enemy.type = Enemy0_Type.Mother;
						}
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