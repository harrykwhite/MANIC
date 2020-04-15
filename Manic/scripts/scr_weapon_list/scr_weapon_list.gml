enum WeaponType{
    Ranged,
    Melee,
    Throwing,
	Standalone,
}

enum PlayerWeapon{
	MachineGun,
	Stick,
	Revolver,
	Crowbar,
	Knife,
	AssaultRifle,
	Shotgun,
	Machete,
	QuickGun,
	Grenade,
	Rake,
	SniperRifle,
	GrenadeLauncher,
	Uzi,
	Axe,
	Crossbow,
	Sledgehammer,
	MountedMachineGun,
	LandMine,
	FlareGun,
	Flamethrower,
	Katana,
	ToxicGrenade,
	MP5,
	Spear,
	HeavyShotgun,
	Minigun,
	FlareRifle,
	DartPistol,
	MountedMachineGunCart,
	Wrench,
	DartRifle,
	OldHuntingRifle,
	Sickle,
	Battleaxe,
	Bayonet,
	Pickaxe,
	ReinforcedGrenade,
	HuntingMachete,
	Greatsword,
	BaseballBat,
}

enum AmmoType{
	Bullets,
	Fuel,
	Explosives,
	Arrows,
	Darts,
	Shells,
}

enum WeaponLevel{
	VeryLow,
	Low,
	Average,
	High,
	VeryHigh,
}

global.weapon_name[0] = "Machine Gun";
global.weapon_object[0] = obj_weapon_0;
global.weapon_sprite[0] = spr_weapon_0;
global.weapon_centersprite[0] = spr_weapon_0_center;
global.weapon_type[0] = WeaponType.Ranged;
global.weapon_heavy[0] = true;
global.weapon_ammomax[0] = 19;
global.weapon_ammotype[0] = AmmoType.Bullets;
global.weapon_camerarange[0] = 40;
global.weapon_mouse[0] = MouseType.Crosshair;
global.weapon_dualhanded[0] = false;
global.weapon_damage[0] = WeaponLevel.Low;
global.weapon_speed[0] = WeaponLevel.High;

global.weapon_name[1] = "Stick";
global.weapon_object[1] = obj_weapon_1;
global.weapon_sprite[1] = spr_weapon_1;
global.weapon_centersprite[1] = spr_weapon_1_center;
global.weapon_type[1] = WeaponType.Melee;
global.weapon_heavy[1] = false;
global.weapon_camerarange[1] = 20;
global.weapon_mouse[1] = MouseType.SmallCircle;
global.weapon_dualhanded[1] = false;
global.weapon_damage[1] = WeaponLevel.VeryLow;
global.weapon_speed[1] = WeaponLevel.High;

global.weapon_name[2] = "Revolver";
global.weapon_object[2] = obj_weapon_2;
global.weapon_sprite[2] = spr_weapon_2;
global.weapon_centersprite[2] = spr_weapon_2_center;
global.weapon_type[2] = WeaponType.Ranged;
global.weapon_heavy[2] = false;
global.weapon_ammomax[2] = 15;
global.weapon_ammotype[2] = AmmoType.Bullets;
global.weapon_camerarange[2] = 40;
global.weapon_mouse[2] = MouseType.Crosshair;
global.weapon_dualhanded[2] = false;
global.weapon_damage[2] = WeaponLevel.Average;
global.weapon_speed[2] = WeaponLevel.Average;

global.weapon_name[3] = "Crowbar";
global.weapon_object[3] = obj_weapon_3;
global.weapon_sprite[3] = spr_weapon_3;
global.weapon_centersprite[3] = spr_weapon_3_center;
global.weapon_type[3] = WeaponType.Melee;
global.weapon_heavy[3] = false;
global.weapon_camerarange[3] = 20;
global.weapon_mouse[3] = MouseType.SmallCircle;
global.weapon_dualhanded[3] = false;
global.weapon_damage[3] = WeaponLevel.Average;
global.weapon_speed[3] = WeaponLevel.High;

global.weapon_name[4] = "Knife";
global.weapon_object[4] = obj_weapon_4;
global.weapon_sprite[4] = spr_weapon_4;
global.weapon_centersprite[4] = spr_weapon_4_center;
global.weapon_type[4] = WeaponType.Melee;
global.weapon_heavy[4] = false;
global.weapon_camerarange[4] = 20;
global.weapon_mouse[4] = MouseType.SmallCrosshair;
global.weapon_dualhanded[4] = false;
global.weapon_damage[4] = WeaponLevel.VeryLow;
global.weapon_speed[4] = WeaponLevel.High;

global.weapon_name[5] = "Assault Rifle";
global.weapon_object[5] = obj_weapon_5;
global.weapon_sprite[5] = spr_weapon_5;
global.weapon_centersprite[5] = spr_weapon_5_center;
global.weapon_type[5] = WeaponType.Ranged;
global.weapon_heavy[5] = true;
global.weapon_ammomax[5] = 21;
global.weapon_ammotype[5] = AmmoType.Bullets;
global.weapon_camerarange[5] = 40;
global.weapon_mouse[5] = MouseType.Crosshair;
global.weapon_dualhanded[5] = false;
global.weapon_damage[5] = WeaponLevel.Average;
global.weapon_speed[5] = WeaponLevel.High;

global.weapon_name[6] = "Shotgun";
global.weapon_object[6] = obj_weapon_6;
global.weapon_sprite[6] = spr_weapon_6;
global.weapon_centersprite[6] = spr_weapon_6_center;
global.weapon_type[6] = WeaponType.Ranged;
global.weapon_heavy[6] = true;
global.weapon_ammomax[6] = 7;
global.weapon_ammotype[6] = AmmoType.Shells;
global.weapon_camerarange[6] = 40;
global.weapon_mouse[6] = MouseType.LargeCircle;
global.weapon_dualhanded[6] = false;
global.weapon_damage[6] = WeaponLevel.VeryHigh;
global.weapon_speed[6] = WeaponLevel.Low;

global.weapon_name[7] = "Machete";
global.weapon_object[7] = obj_weapon_7;
global.weapon_sprite[7] = spr_weapon_7;
global.weapon_centersprite[7] = spr_weapon_7_center;
global.weapon_type[7] = WeaponType.Melee;
global.weapon_heavy[7] = false;
global.weapon_camerarange[7] = 20;
global.weapon_mouse[7] = MouseType.SmallCircle;
global.weapon_dualhanded[7] = false;
global.weapon_damage[7] = WeaponLevel.Low;
global.weapon_speed[7] = WeaponLevel.High;

global.weapon_name[8] = "Quick Gun";
global.weapon_object[8] = obj_weapon_8;
global.weapon_sprite[8] = spr_weapon_8;
global.weapon_centersprite[8] = spr_weapon_8_center;
global.weapon_type[8] = WeaponType.Ranged;
global.weapon_heavy[8] = true;
global.weapon_ammomax[8] = 26;
global.weapon_ammotype[8] = AmmoType.Bullets;
global.weapon_camerarange[8] = 40;
global.weapon_mouse[8] = MouseType.Crosshair;
global.weapon_dualhanded[8] = false;
global.weapon_damage[8] = WeaponLevel.Low;
global.weapon_speed[8] = WeaponLevel.VeryHigh;

global.weapon_name[9] = "Grenade";
global.weapon_object[9] = obj_weapon_9;
global.weapon_sprite[9] = spr_weapon_9;
global.weapon_centersprite[9] = spr_weapon_9;
global.weapon_type[9] = WeaponType.Throwing;
global.weapon_heavy[9] = false;
global.weapon_camerarange[9] = 10;
global.weapon_mouse[9] = MouseType.SmallCircle;
global.weapon_dualhanded[9] = false;
global.weapon_damage[9] = WeaponLevel.VeryHigh;
global.weapon_speed[9] = WeaponLevel.Low;

global.weapon_name[10] = "Rake";
global.weapon_object[10] = obj_weapon_10;
global.weapon_sprite[10] = spr_weapon_10;
global.weapon_centersprite[10] = spr_weapon_10_center;
global.weapon_type[10] = WeaponType.Melee;
global.weapon_heavy[10] = true;
global.weapon_camerarange[10] = 30;
global.weapon_mouse[10] = MouseType.SmallCircle;
global.weapon_dualhanded[10] = true;
global.weapon_damage[10] = WeaponLevel.VeryLow;
global.weapon_speed[10] = WeaponLevel.High;

global.weapon_name[11] = "Sniper Rifle";
global.weapon_object[11] = obj_weapon_11;
global.weapon_sprite[11] = spr_weapon_11;
global.weapon_centersprite[11] = spr_weapon_11_center;
global.weapon_type[11] = WeaponType.Ranged;
global.weapon_heavy[11] = true;
global.weapon_ammomax[11] = 6;
global.weapon_ammotype[11] = AmmoType.Bullets;
global.weapon_camerarange[11] = 50;
global.weapon_mouse[11] = MouseType.Crosshair;
global.weapon_dualhanded[11] = false;
global.weapon_damage[11] = WeaponLevel.VeryHigh;
global.weapon_speed[11] = WeaponLevel.VeryLow;

global.weapon_name[12] = "Grenade Launcher";
global.weapon_object[12] = obj_weapon_12;
global.weapon_sprite[12] = spr_weapon_12;
global.weapon_centersprite[12] = spr_weapon_12_center;
global.weapon_type[12] = WeaponType.Ranged;
global.weapon_heavy[12] = true;
global.weapon_ammomax[12] = 5;
global.weapon_ammotype[12] = AmmoType.Explosives;
global.weapon_camerarange[12] = 40;
global.weapon_mouse[12] = MouseType.SmallCircle;
global.weapon_dualhanded[12] = false;
global.weapon_damage[12] = WeaponLevel.High;
global.weapon_speed[12] = WeaponLevel.Low;

global.weapon_name[13] = "Uzi";
global.weapon_object[13] = obj_weapon_13;
global.weapon_sprite[13] = spr_weapon_13;
global.weapon_centersprite[13] = spr_weapon_13_center;
global.weapon_type[13] = WeaponType.Ranged;
global.weapon_heavy[13] = false;
global.weapon_ammomax[13] = 27;
global.weapon_ammotype[13] = AmmoType.Bullets;
global.weapon_camerarange[13] = 40;
global.weapon_mouse[13] = MouseType.Crosshair;
global.weapon_dualhanded[13] = false;
global.weapon_damage[13] = WeaponLevel.Low;
global.weapon_speed[13] = WeaponLevel.VeryHigh;

global.weapon_name[14] = "Axe";
global.weapon_object[14] = obj_weapon_14;
global.weapon_sprite[14] = spr_weapon_14;
global.weapon_centersprite[14] = spr_weapon_14_center;
global.weapon_type[14] = WeaponType.Melee;
global.weapon_heavy[14] = false;
global.weapon_camerarange[14] = 20;
global.weapon_mouse[14] = MouseType.SmallCircle;
global.weapon_dualhanded[14] = false;
global.weapon_damage[14] = WeaponLevel.High;
global.weapon_speed[14] = WeaponLevel.Low;

global.weapon_name[15] = "Crossbow";
global.weapon_object[15] = obj_weapon_15;
global.weapon_sprite[15] = spr_weapon_15;
global.weapon_centersprite[15] = spr_weapon_15_center;
global.weapon_type[15] = WeaponType.Ranged;
global.weapon_heavy[15] = true;
global.weapon_ammomax[15] = 14;
global.weapon_ammotype[15] = AmmoType.Arrows;
global.weapon_camerarange[15] = 40;
global.weapon_mouse[15] = MouseType.SmallCrosshair;
global.weapon_dualhanded[15] = false;
global.weapon_damage[15] = WeaponLevel.Average;
global.weapon_speed[15] = WeaponLevel.Average;

global.weapon_name[16] = "Sledgehammer";
global.weapon_object[16] = obj_weapon_16;
global.weapon_sprite[16] = spr_weapon_16;
global.weapon_centersprite[16] = spr_weapon_16_center;
global.weapon_type[16] = WeaponType.Melee;
global.weapon_heavy[16] = true;
global.weapon_camerarange[16] = 20;
global.weapon_mouse[16] = MouseType.SmallCircle;
global.weapon_dualhanded[16] = false;
global.weapon_damage[16] = WeaponLevel.VeryHigh;
global.weapon_speed[16] = WeaponLevel.VeryLow;

global.weapon_name[17] = "Mounted Machine Gun";
global.weapon_object[17] = obj_weapon_17;
global.weapon_sprite[17] = spr_weapon_17;
global.weapon_centersprite[17] = spr_weapon_17_center;
global.weapon_type[17] = WeaponType.Ranged;
global.weapon_heavy[17] = true;
global.weapon_ammomax[17] = 64;
global.weapon_ammotype[17] = AmmoType.Bullets;
global.weapon_camerarange[17] = 40;
global.weapon_mouse[17] = MouseType.Crosshair;
global.weapon_dualhanded[17] = false;
global.weapon_damage[17] = WeaponLevel.Average;
global.weapon_speed[17] = WeaponLevel.High;

global.weapon_name[18] = "Land Mine";
global.weapon_object[18] = obj_weapon_18;
global.weapon_sprite[18] = spr_weapon_18;
global.weapon_centersprite[18] = spr_weapon_18;
global.weapon_type[18] = WeaponType.Throwing;
global.weapon_heavy[18] = false;
global.weapon_camerarange[18] = 10;
global.weapon_mouse[18] = MouseType.SmallCircle;
global.weapon_dualhanded[18] = false;
global.weapon_damage[18] = WeaponLevel.VeryHigh;
global.weapon_speed[18] = WeaponLevel.Average;

global.weapon_name[19] = "Flare Gun";
global.weapon_object[19] = obj_weapon_19;
global.weapon_sprite[19] = spr_weapon_19;
global.weapon_centersprite[19] = spr_weapon_19_center;
global.weapon_type[19] = WeaponType.Ranged;
global.weapon_heavy[19] = false;
global.weapon_ammomax[19] = 8;
global.weapon_ammotype[19] = AmmoType.Fuel;
global.weapon_camerarange[19] = 40;
global.weapon_mouse[19] = MouseType.SmallCrosshair;
global.weapon_dualhanded[19] = false;
global.weapon_damage[19] = WeaponLevel.Average;
global.weapon_speed[19] = WeaponLevel.Average;

global.weapon_name[20] = "Flamethrower";
global.weapon_object[20] = obj_weapon_20;
global.weapon_sprite[20] = spr_weapon_20;
global.weapon_centersprite[20] = spr_weapon_20_center;
global.weapon_type[20] = WeaponType.Ranged;
global.weapon_heavy[20] = true;
global.weapon_ammomax[20] = 72;
global.weapon_ammotype[20] = AmmoType.Fuel;
global.weapon_camerarange[20] = 40;
global.weapon_mouse[20] = MouseType.LargeCircle;
global.weapon_dualhanded[20] = false;
global.weapon_damage[20] = WeaponLevel.High;
global.weapon_speed[20] = WeaponLevel.High;

global.weapon_name[21] = "Katana";
global.weapon_object[21] = obj_weapon_21;
global.weapon_sprite[21] = spr_weapon_21;
global.weapon_centersprite[21] = spr_weapon_21_center;
global.weapon_type[21] = WeaponType.Melee;
global.weapon_heavy[21] = false;
global.weapon_camerarange[21] = 20;
global.weapon_mouse[21] = MouseType.SmallCircle;
global.weapon_dualhanded[21] = false;
global.weapon_damage[21] = WeaponLevel.VeryLow;
global.weapon_speed[21] = WeaponLevel.VeryHigh;

global.weapon_name[22] = "Toxic Grenade";
global.weapon_object[22] = obj_weapon_22;
global.weapon_sprite[22] = spr_weapon_22;
global.weapon_centersprite[22] = spr_weapon_22;
global.weapon_type[22] = WeaponType.Throwing;
global.weapon_heavy[22] = false;
global.weapon_camerarange[22] = 10;
global.weapon_mouse[22] = MouseType.SmallCircle;
global.weapon_dualhanded[22] = false;
global.weapon_damage[22] = WeaponLevel.VeryHigh;
global.weapon_speed[22] = WeaponLevel.Low;

global.weapon_name[23] = "MP5";
global.weapon_object[23] = obj_weapon_23;
global.weapon_sprite[23] = spr_weapon_23;
global.weapon_centersprite[23] = spr_weapon_23_center;
global.weapon_type[23] = WeaponType.Ranged;
global.weapon_heavy[23] = false;
global.weapon_ammomax[23] = 23;
global.weapon_ammotype[23] = AmmoType.Bullets;
global.weapon_camerarange[23] = 40;
global.weapon_mouse[23] = MouseType.Crosshair;
global.weapon_dualhanded[23] = false;
global.weapon_damage[23] = WeaponLevel.Low;
global.weapon_speed[23] = WeaponLevel.VeryHigh;

global.weapon_name[24] = "Spear";
global.weapon_object[24] = obj_weapon_24;
global.weapon_sprite[24] = spr_weapon_24;
global.weapon_centersprite[24] = spr_weapon_24_center;
global.weapon_type[24] = WeaponType.Melee;
global.weapon_heavy[24] = true;
global.weapon_camerarange[24] = 30;
global.weapon_mouse[24] = MouseType.SmallCircle;
global.weapon_dualhanded[24] = true;
global.weapon_damage[24] = WeaponLevel.VeryLow;
global.weapon_speed[24] = WeaponLevel.VeryHigh;

global.weapon_name[25] = "Heavy Shotgun";
global.weapon_object[25] = obj_weapon_25;
global.weapon_sprite[25] = spr_weapon_25;
global.weapon_centersprite[25] = spr_weapon_25_center;
global.weapon_type[25] = WeaponType.Ranged;
global.weapon_heavy[25] = true;
global.weapon_ammomax[25] = 4;
global.weapon_ammotype[25] = AmmoType.Shells;
global.weapon_camerarange[25] = 40;
global.weapon_mouse[25] = MouseType.LargeCircle;
global.weapon_dualhanded[25] = false;
global.weapon_damage[25] = WeaponLevel.VeryHigh;
global.weapon_speed[25] = WeaponLevel.VeryLow;

global.weapon_name[26] = "Minigun";
global.weapon_object[26] = obj_weapon_26;
global.weapon_sprite[26] = spr_weapon_26;
global.weapon_centersprite[26] = spr_weapon_26_center;
global.weapon_type[26] = WeaponType.Ranged;
global.weapon_heavy[26] = true;
global.weapon_ammomax[26] = 32;
global.weapon_ammotype[26] = AmmoType.Bullets;
global.weapon_camerarange[26] = 40;
global.weapon_mouse[26] = MouseType.Crosshair;
global.weapon_dualhanded[26] = false;
global.weapon_damage[26] = WeaponLevel.Average;
global.weapon_speed[26] = WeaponLevel.VeryHigh;

global.weapon_name[27] = "Flare Rifle";
global.weapon_object[27] = obj_weapon_27;
global.weapon_sprite[27] = spr_weapon_27;
global.weapon_centersprite[27] = spr_weapon_27_center;
global.weapon_type[27] = WeaponType.Ranged;
global.weapon_heavy[27] = true;
global.weapon_ammomax[27] = 17;
global.weapon_ammotype[27] = AmmoType.Fuel;
global.weapon_camerarange[27] = 40;
global.weapon_mouse[27] = MouseType.SmallCrosshair;
global.weapon_dualhanded[27] = false;
global.weapon_damage[27] = WeaponLevel.Low;
global.weapon_speed[27] = WeaponLevel.High;

global.weapon_name[28] = "Dart Pistol";
global.weapon_object[28] = obj_weapon_28;
global.weapon_sprite[28] = spr_weapon_28;
global.weapon_centersprite[28] = spr_weapon_28_center;
global.weapon_type[28] = WeaponType.Ranged;
global.weapon_heavy[28] = false;
global.weapon_ammomax[28] = 15;
global.weapon_ammotype[28] = AmmoType.Darts;
global.weapon_camerarange[28] = 40;
global.weapon_mouse[28] = MouseType.SmallCrosshair;
global.weapon_dualhanded[28] = false;
global.weapon_damage[28] = WeaponLevel.High;
global.weapon_speed[28] = WeaponLevel.Average;

global.weapon_name[29] = "Mounted Machine Gun";
global.weapon_object[29] = obj_weapon_29;
global.weapon_sprite[29] = spr_weapon_29;
global.weapon_centersprite[29] = spr_weapon_29_center;
global.weapon_type[29] = WeaponType.Ranged;
global.weapon_heavy[29] = true;
global.weapon_ammomax[29] = 64;
global.weapon_ammotype[29] = AmmoType.Bullets;
global.weapon_camerarange[29] = 40;
global.weapon_mouse[29] = MouseType.Crosshair;
global.weapon_dualhanded[29] = false;
global.weapon_damage[29] = WeaponLevel.Average;
global.weapon_speed[29] = WeaponLevel.High;

global.weapon_name[30] = "Wrench";
global.weapon_object[30] = obj_weapon_30;
global.weapon_sprite[30] = spr_weapon_30;
global.weapon_centersprite[30] = spr_weapon_30_center;
global.weapon_type[30] = WeaponType.Melee;
global.weapon_heavy[30] = false;
global.weapon_camerarange[30] = 20;
global.weapon_mouse[30] = MouseType.SmallCircle;
global.weapon_dualhanded[30] = false;
global.weapon_damage[30] = WeaponLevel.Average;
global.weapon_speed[30] = WeaponLevel.VeryHigh;

global.weapon_name[31] = "Dart Rifle";
global.weapon_object[31] = obj_weapon_31;
global.weapon_sprite[31] = spr_weapon_31;
global.weapon_centersprite[31] = spr_weapon_31_center;
global.weapon_type[31] = WeaponType.Ranged;
global.weapon_heavy[31] = true;
global.weapon_ammomax[31] = 21;
global.weapon_ammotype[31] = AmmoType.Darts;
global.weapon_camerarange[31] = 40;
global.weapon_mouse[31] = MouseType.SmallCrosshair;
global.weapon_dualhanded[31] = false;
global.weapon_damage[31] = WeaponLevel.Average;
global.weapon_speed[31] = WeaponLevel.High;

global.weapon_name[32] = "Old Hunting Rifle";
global.weapon_object[32] = obj_weapon_32;
global.weapon_sprite[32] = spr_weapon_32;
global.weapon_centersprite[32] = spr_weapon_32_center;
global.weapon_type[32] = WeaponType.Ranged;
global.weapon_heavy[32] = true;
global.weapon_ammomax[32] = 6;
global.weapon_ammotype[32] = AmmoType.Bullets;
global.weapon_camerarange[32] = 40;
global.weapon_mouse[32] = MouseType.Crosshair;
global.weapon_dualhanded[32] = false;
global.weapon_damage[32] = WeaponLevel.High;
global.weapon_speed[32] = WeaponLevel.VeryLow;

global.weapon_name[33] = "Sickle";
global.weapon_object[33] = obj_weapon_33;
global.weapon_sprite[33] = spr_weapon_33;
global.weapon_centersprite[33] = spr_weapon_33_center;
global.weapon_type[33] = WeaponType.Melee;
global.weapon_heavy[33] = false;
global.weapon_camerarange[33] = 20;
global.weapon_mouse[33] = MouseType.SmallCircle;
global.weapon_dualhanded[33] = false;
global.weapon_damage[33] = WeaponLevel.Low;
global.weapon_speed[33] = WeaponLevel.High;

global.weapon_name[34] = "Battleaxe";
global.weapon_object[34] = obj_weapon_34;
global.weapon_sprite[34] = spr_weapon_34;
global.weapon_centersprite[34] = spr_weapon_34_center;
global.weapon_type[34] = WeaponType.Melee;
global.weapon_heavy[34] = false;
global.weapon_camerarange[34] = 20;
global.weapon_mouse[34] = MouseType.SmallCircle;
global.weapon_dualhanded[34] = false;
global.weapon_damage[34] = WeaponLevel.High;
global.weapon_speed[34] = WeaponLevel.High;

global.weapon_name[35] = "Bayonet";
global.weapon_object[35] = obj_weapon_35;
global.weapon_sprite[35] = spr_weapon_35;
global.weapon_centersprite[35] = spr_weapon_35_center;
global.weapon_type[35] = WeaponType.Melee;
global.weapon_heavy[35] = false;
global.weapon_camerarange[35] = 20;
global.weapon_mouse[35] = MouseType.Dot;
global.weapon_dualhanded[35] = false;
global.weapon_damage[35] = WeaponLevel.VeryLow;
global.weapon_speed[35] = WeaponLevel.High;

global.weapon_name[36] = "Pickaxe";
global.weapon_object[36] = obj_weapon_36;
global.weapon_sprite[36] = spr_weapon_36;
global.weapon_centersprite[36] = spr_weapon_36_center;
global.weapon_type[36] = WeaponType.Melee;
global.weapon_heavy[36] = true;
global.weapon_camerarange[36] = 20;
global.weapon_mouse[36] = MouseType.SmallCircle;
global.weapon_dualhanded[36] = false;
global.weapon_damage[36] = WeaponLevel.High;
global.weapon_speed[36] = WeaponLevel.VeryLow;

global.weapon_name[37] = "Reinforced Grenade";
global.weapon_object[37] = obj_weapon_37;
global.weapon_sprite[37] = spr_weapon_37;
global.weapon_centersprite[37] = spr_weapon_37;
global.weapon_type[37] = WeaponType.Throwing;
global.weapon_heavy[37] = false;
global.weapon_camerarange[37] = 10;
global.weapon_mouse[37] = MouseType.SmallCircle;
global.weapon_dualhanded[37] = false;
global.weapon_damage[37] = WeaponLevel.VeryHigh;
global.weapon_speed[37] = WeaponLevel.Average;

global.weapon_name[38] = "Hunting Machete";
global.weapon_object[38] = obj_weapon_38;
global.weapon_sprite[38] = spr_weapon_38;
global.weapon_centersprite[38] = spr_weapon_38_center;
global.weapon_type[38] = WeaponType.Melee;
global.weapon_heavy[38] = false;
global.weapon_camerarange[38] = 20;
global.weapon_mouse[38] = MouseType.SmallCircle;
global.weapon_dualhanded[38] = false;
global.weapon_damage[38] = WeaponLevel.Low;
global.weapon_speed[38] = WeaponLevel.High;

global.weapon_name[39] = "Greatsword";
global.weapon_object[39] = obj_weapon_39;
global.weapon_sprite[39] = spr_weapon_39;
global.weapon_centersprite[39] = spr_weapon_39_center;
global.weapon_type[39] = WeaponType.Melee;
global.weapon_heavy[39] = false;
global.weapon_camerarange[39] = 20;
global.weapon_mouse[39] = MouseType.SmallCircle;
global.weapon_dualhanded[39] = false;
global.weapon_damage[39] = WeaponLevel.VeryHigh;
global.weapon_speed[39] = WeaponLevel.VeryLow;

global.weapon_name[40] = "Baseball Bat";
global.weapon_object[40] = obj_weapon_40;
global.weapon_sprite[40] = spr_weapon_40;
global.weapon_centersprite[40] = spr_weapon_40_center;
global.weapon_type[40] = WeaponType.Melee;
global.weapon_heavy[40] = false;
global.weapon_camerarange[40] = 20;
global.weapon_mouse[40] = MouseType.SmallCircle;
global.weapon_dualhanded[40] = false;
global.weapon_damage[40] = WeaponLevel.Average;
global.weapon_speed[40] = WeaponLevel.Average;

global.weapon_slot[0] = PlayerWeapon.Revolver;
global.weapon_slotammo[0] = global.weapon_ammomax[PlayerWeapon.Revolver];
global.weapon_slotquantity[0] = -1;
global.weapon_slotscale[0] = 1;

global.weapon_slot[1] = -1;
global.weapon_slotammo[1] = -1;
global.weapon_slotquantity[1] = -1;
global.weapon_slotscale[1] = 1;

global.weapon_slot[2] = -1;
global.weapon_slotammo[2] = -1;
global.weapon_slotquantity[2] = -1;
global.weapon_slotscale[2] = 1;

global.weapon_slot_standalone = -1;
global.weapon_slot_standalone_ammo = -1;

global.weapon_slotcurrent = 0;
global.weapon_slotprevious = 1;

global.weapon_slotmax = 2; // How many slots the player currently has
global.weapon_potential_slotmax = 3; // How many slots the player can potentially have throughout the game

global.weapon_default = -1;
global.weapon_default_set = false;

if (room == rm_ini){
	var count = array_length_1d(global.weapon_name);
	for(var i = 0; i < count; i ++){
		global.weapon_collected[i] = false;
	}
}