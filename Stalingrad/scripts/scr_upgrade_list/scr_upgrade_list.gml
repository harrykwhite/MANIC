enum PlayerUpgrade{
	Goggles,
}

global.upgrade_name[0] = "Goggles";
global.upgrade_sprite[0] = spr_player_upgrade_goggles_0;
global.upgrade_sprite_corpse[0] = spr_player_upgrade_goggles_0_corpse;

global.player_upgrades = ds_list_create();

scr_upgrade_add(PlayerUpgrade.Goggles);