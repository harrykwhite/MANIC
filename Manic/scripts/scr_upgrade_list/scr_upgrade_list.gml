enum PlayerUpgrade{
	Goggles, // Collectable
	Backpack,
	Chestplate, // Collectable
	AmmoPack, // Collectable
	GasMask, // Collectable, position must change
	RunningBoots, // Collectable
	KneePads, // Collectable
	IronGlove, // Collectable
	HeadLight, // Collectable
}

global.upgrade_name[0] = "Goggles";
global.upgrade_description[0] = "Opponents will glow in the dark";
global.upgrade_sprite[0] = spr_player_upgrade_goggles_0;
global.upgrade_sprite_corpse[0] = spr_player_upgrade_goggles_0_corpse;
global.upgrade_sprite_pickup[0] = spr_player_upgrade_goggles_0_pickup;
global.upgrade_behind[0] = false;
global.upgrade_equipped[0] = false;

global.upgrade_name[1] = "Backpack";
global.upgrade_description[1] = "Provides an additional weapon slot";
global.upgrade_sprite[1] = spr_player_upgrade_backpack_0;
global.upgrade_sprite_corpse[1] = spr_player_upgrade_backpack_0_corpse;
global.upgrade_sprite_pickup[1] = spr_player_upgrade_backpack_0_pickup;
global.upgrade_behind[1] = true;
global.upgrade_equipped[1] = false;

global.upgrade_name[2] = "Chestplate";
global.upgrade_description[2] = "Doubles the maximum health";
global.upgrade_sprite[2] = spr_player_upgrade_chestpiece_0;
global.upgrade_sprite_corpse[2] = spr_player_upgrade_chestpiece_0_corpse;
global.upgrade_sprite_pickup[2] = spr_player_upgrade_chestpiece_0_pickup;
global.upgrade_behind[2] = false;
global.upgrade_equipped[2] = false;

global.upgrade_name[3] = "Ammo Pack";
global.upgrade_description[3] = "30% chance to not consume ammo";
global.upgrade_sprite[3] = spr_player_upgrade_ammopack_0;
global.upgrade_sprite_corpse[3] = spr_player_upgrade_ammopack_0_corpse;
global.upgrade_sprite_pickup[3] = spr_player_upgrade_ammopack_0_pickup;
global.upgrade_behind[3] = false;
global.upgrade_equipped[3] = false;

global.upgrade_name[4] = "Gas Mask";
global.upgrade_description[4] = "Provides immunity to poison and toxic gas";
global.upgrade_sprite[4] = spr_player_upgrade_gasmask_0;
global.upgrade_sprite_corpse[4] = spr_player_upgrade_gasmask_0_corpse;
global.upgrade_sprite_pickup[4] = spr_player_upgrade_gasmask_0_pickup;
global.upgrade_behind[4] = false;
global.upgrade_equipped[4] = false;

global.upgrade_name[5] = "Running Boots";
global.upgrade_description[5] = "Increased movement speed";
global.upgrade_sprite[5] = spr_player_upgrade_runningboots_0;
global.upgrade_sprite_corpse[5] = spr_player_upgrade_runningboots_0_corpse;
global.upgrade_sprite_pickup[5] = spr_player_upgrade_runningboots_0_pickup;
global.upgrade_behind[5] = false;
global.upgrade_equipped[5] = false;

global.upgrade_name[6] = "Knee Pads";
global.upgrade_description[6] = "Provides the ability to double dash";
global.upgrade_sprite[6] = spr_player_upgrade_kneepads_0;
global.upgrade_sprite_corpse[6] = spr_player_upgrade_kneepads_0_corpse;
global.upgrade_sprite_pickup[6]= spr_player_upgrade_kneepads_0_pickup;
global.upgrade_behind[6] = false;
global.upgrade_equipped[6] = false;

global.upgrade_name[7] = "Iron Glove";
global.upgrade_description[7] = "75% increased attack knockback";
global.upgrade_sprite[7] = spr_player_upgrade_ironglove_0;
global.upgrade_sprite_corpse[7] = spr_player_upgrade_ironglove_0_corpse;
global.upgrade_sprite_pickup[7]= spr_player_upgrade_ironglove_0_pickup;
global.upgrade_behind[7] = false;
global.upgrade_equipped[7] = false;

global.upgrade_name[8] = "Head Light";
global.upgrade_description[8] = "Provides greater surrounding light";
global.upgrade_sprite[8] = spr_player_upgrade_headlight_0;
global.upgrade_sprite_corpse[8] = spr_player_upgrade_headlight_0_corpse;
global.upgrade_sprite_pickup[8]= spr_player_upgrade_headlight_0_pickup;
global.upgrade_behind[8] = false;
global.upgrade_equipped[8] = false;