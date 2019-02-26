type = EnemyOneType.Sniper;
weapon_index = PawnWeapon.SniperRifle;
sniper_cutscene_prop = true;
sniper_in_cutscene = false;
if (global.game_firstsniper_killed){
	instance_destroy();
}