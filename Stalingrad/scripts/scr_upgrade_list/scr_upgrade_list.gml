enum PlayerUpgrade{
	Goggles,
	Backpack,
}

global.upgrade_name[0] = "Goggles";
global.upgrade_sprite[0] = spr_player_upgrade_goggles_0;
global.upgrade_sprite_corpse[0] = spr_player_upgrade_goggles_0_corpse;
global.upgrade_behind[0] = false;

global.upgrade_name[1] = "Backpack";
global.upgrade_sprite[1] = spr_player_upgrade_backpack_0;
global.upgrade_sprite_corpse[1] = spr_player_upgrade_backpack_0_corpse;
global.upgrade_behind[1] = true;

global.upgrade_name[2] = "Backpack";
global.upgrade_sprite[2] = spr_player_upgrade_backpack_0;
global.upgrade_sprite_corpse[2] = spr_player_upgrade_backpack_0_corpse;
global.upgrade_behind[2] = true;

global.player_upgrades = ds_list_create();

scr_upgrade_add(PlayerUpgrade.Goggles);
scr_upgrade_add(PlayerUpgrade.Backpack);