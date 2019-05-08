type = Enemy0_Type.Sniper;
weapon_index = PawnWeapon.SniperRifle;
cutscene_prop = true;
in_cutscene = false;
if (global.game_firstsniper_killed){
	instance_destroy();
}