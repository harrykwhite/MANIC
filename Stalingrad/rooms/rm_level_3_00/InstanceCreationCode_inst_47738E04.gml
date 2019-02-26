type = EnemyOneType.Grenadier;
weapon_index = PawnWeapon.Grenade;
grenadier_cutscene_prop = true;
grenadier_in_cutscene = false;
if (global.game_firstgrenadier_killed){
	instance_destroy();
}