if (scr_object_spawn_grenade()){
	scr_upgrade_add(PlayerUpgrade.Backpack);
}

if (global.level_current >= Level.HumanPrison){
	scr_upgrade_add(PlayerUpgrade.ExplosiveVest);
}

if (global.level_current >= Level.TrainStation){
	scr_upgrade_add(PlayerUpgrade.DashBoots);
}

if (global.level_current >= Level.CityHeadquarters){
	scr_upgrade_add(PlayerUpgrade.Chestplate);
	
	if (!global.game_is_playthrough){
		global.player_health_current = global.player_health_max;
	}
}