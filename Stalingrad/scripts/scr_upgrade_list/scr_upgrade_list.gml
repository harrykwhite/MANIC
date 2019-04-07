enum PlayerUpgrade{
	Goggles,
	Backpack,
	Chestplate,
	AmmoPack,
	GasMask,
	RunningBoots,
	KneePads,
}

global.upgrade_name[0] = "Goggles";
global.upgrade_description[0] = "Opponents glow in the dark";
global.upgrade_sprite[0] = spr_player_upgrade_goggles_0;
global.upgrade_sprite_corpse[0] = spr_player_upgrade_goggles_0_corpse;
global.upgrade_sprite_pickup[0] = spr_player_upgrade_goggles_0_pickup;
global.upgrade_behind[0] = false;

global.upgrade_name[1] = "Backpack";
global.upgrade_description[1] = "Provides an additional weapon\nslot";
global.upgrade_sprite[1] = spr_player_upgrade_backpack_0;
global.upgrade_sprite_corpse[1] = spr_player_upgrade_backpack_0_corpse;
global.upgrade_sprite_pickup[1] = spr_player_upgrade_backpack_0_pickup;
global.upgrade_behind[1] = true;

global.upgrade_name[2] = "Chestplate";
global.upgrade_description[2] = "Doubles the maximum health";
global.upgrade_sprite[2] = spr_player_upgrade_chestpiece_0;
global.upgrade_sprite_corpse[2] = spr_player_upgrade_chestpiece_0_corpse;
global.upgrade_sprite_pickup[2] = spr_player_upgrade_chestpiece_0_pickup;
global.upgrade_behind[2] = false;

global.upgrade_name[3] = "Ammo Pack";
global.upgrade_description[3] = "30% chance to not consume ammo";
global.upgrade_sprite[3] = spr_player_upgrade_ammopack_0;
global.upgrade_sprite_corpse[3] = spr_player_upgrade_ammopack_0_corpse;
global.upgrade_sprite_pickup[3] = spr_player_upgrade_ammopack_0_pickup;
global.upgrade_behind[3] = false;

global.upgrade_name[4] = "Gas Mask";
global.upgrade_description[4] = "Provides immunity to poison and\ntoxic gases";
global.upgrade_sprite[4] = spr_player_upgrade_gasmask_0;
global.upgrade_sprite_corpse[4] = spr_player_upgrade_gasmask_0_corpse;
global.upgrade_sprite_pickup[4] = spr_player_upgrade_gasmask_0_pickup;
global.upgrade_behind[4] = false;

global.upgrade_name[5] = "Running Boots";
global.upgrade_description[5] = "Increased movement speed";
global.upgrade_sprite[5] = spr_player_upgrade_runningboots_0;
global.upgrade_sprite_corpse[5] = spr_player_upgrade_runningboots_0_corpse;
global.upgrade_sprite_pickup[5] = spr_player_upgrade_runningboots_0_pickup;
global.upgrade_behind[5] = false;

global.upgrade_name[6] = "Knee Pads";
global.upgrade_description[6] = "Provides the ability to double dash";
global.upgrade_sprite[6] = spr_player_upgrade_kneepads_0;
global.upgrade_sprite_corpse[6] = spr_player_upgrade_kneepads_0_corpse;
global.upgrade_sprite_pickup[6]= spr_player_upgrade_kneepads_0_pickup;
global.upgrade_behind[6] = false;

global.player_upgrades = ds_list_create();