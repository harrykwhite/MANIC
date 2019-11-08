if (global.level_current >= Level.UndergroundBunker){
	scr_upgrade_add(PlayerUpgrade.Backpack);
}

if (global.level_current >= Level.TrainStation){
	scr_upgrade_add(PlayerUpgrade.DashBoots);
}

if (global.level_current >= Level.DesolateVillage){
	scr_upgrade_add(PlayerUpgrade.GasMask);
}

if (global.level_current >= Level.CityHeadquarters){
	scr_upgrade_add(PlayerUpgrade.Chestplate);
}