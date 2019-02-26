type = EnemyOneType.Crazy;
weapon_index = PawnWeapon.Machete;
crazy_cutscene_prop = true;
crazy_in_cutscene = false;
if (global.game_firstcrazy_killed){
	instance_destroy();
}