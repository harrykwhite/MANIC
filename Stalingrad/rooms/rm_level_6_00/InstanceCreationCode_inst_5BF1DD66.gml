type = EnemyOneType.Healer;
weapon_index = PawnWeapon.Axe;
healer_cutscene_prop = true;
healer_in_cutscene = false;
healer_healselftime = 20;
if (global.game_firsthealer_killed){
	instance_destroy();
}