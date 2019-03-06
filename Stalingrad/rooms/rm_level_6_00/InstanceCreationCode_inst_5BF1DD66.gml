type = EnemyOneType.Healer;
weapon_index = PawnWeapon.Axe;
cutscene_prop = true;
in_cutscene = false;
healer_healselftime = 20;
if (global.game_firsthealer_killed){
	instance_destroy();
}