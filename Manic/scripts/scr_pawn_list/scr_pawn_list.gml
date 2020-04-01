// Enemy Pawns
global.enemy[0] = obj_enemy_0;
global.enemy[1] = obj_enemy_1;
global.enemy[2] = obj_enemy_2;
global.enemy[3] = obj_enemy_3;
global.enemy[4] = obj_enemy_4;
global.enemy[5] = obj_enemy_5;
global.enemy[6] = obj_thescorched;
global.enemy[7] = obj_thedogkeeper;
global.enemy[8] = obj_thedogkeeper_dog;
global.enemy[9] = obj_giantturret;
global.enemy[10] = obj_giantturret_flamethrower;
global.enemy[11] = obj_antagonist;

// Companion Pawns
global.companion[0] = obj_companion_0;
global.companion_mapicon[0] = spr_companion_0_head_0_minimap;

global.companion[1] = obj_companion_1;
global.companion_mapicon[1] = spr_companion_1_head_0_minimap;

global.companion[2] = obj_companion_2;
global.companion_mapicon[2] = spr_companion_2_head_0_minimap;

global.companion[3] = obj_companion_3;
global.companion_mapicon[3] = spr_companion_3_head_0_minimap;

global.companion_death_time_max = 60 * 15;

// Boss Pawns
enum Boss{
	EnemyHorde,
	MotherRobot,
	SniperRobot,
	TrainBoss,
	TheScorched,
	TheDogkeeper,
	GiantTurret,
	Antagonist,
}

global.boss_name[0] = "Enemy Horde";
global.boss_music[0] = m_boss_main_0;
global.boss_stinger[0] = m_boss_stinger_0;

global.boss_name[1] = "Mother Robot";
global.boss_music[1] = noone;
global.boss_stinger[1] = noone;

global.boss_name[2] = "Sniper Robot";
global.boss_music[2] = noone;
global.boss_stinger[2] = noone;

global.boss_name[3] = "Train Horde";
global.boss_music[3] = m_boss_main_0;
global.boss_stinger[3] = m_boss_stinger_0;

global.boss_name[4] = "The Scorched";
global.boss_music[4] = m_boss_main_0;
global.boss_stinger[4] = m_boss_stinger_0;

global.boss_name[5] = "The Dog Keeper";
global.boss_music[5] = m_boss_main_0;
global.boss_stinger[5] = m_boss_stinger_0;

global.boss_name[6] = "Giant Turret";
global.boss_music[6] = m_boss_main_0;
global.boss_stinger[6] = m_boss_stinger_0;

global.boss_name[7] = "Antagonist";
global.boss_music[7] = m_boss_main_0;
global.boss_stinger[7] = m_boss_stinger_0;

// Enumerators
enum Enemy0_Type{
	Normal,
	Grenadier,
	Sniper,
	Mother,
	Crazy,
	Fly,
	TrainBoss,
	Healer,
}

enum PawnWeapon{
	Stick,
	Crowbar,
	Machete,
	Knife,
	Grenade,
	Axe,
	Rake,
	Sledgehammer,
	SniperRifle,
	Spear,
	Flamethrower,
	HeavyShotgun,
	Revolver,
	Katana,
	Greatsword,
}

// Pawn Weapons
global.pawnweapon_object[0] = obj_pawnweapon_0;
global.pawnweapon_playerindex[0] = PlayerWeapon.Stick;

global.pawnweapon_object[1] = obj_pawnweapon_1;
global.pawnweapon_playerindex[1] = PlayerWeapon.Crowbar;

global.pawnweapon_object[2] = obj_pawnweapon_2;
global.pawnweapon_playerindex[2] = PlayerWeapon.Machete;

global.pawnweapon_object[3] = obj_pawnweapon_3;
global.pawnweapon_playerindex[3] = PlayerWeapon.Knife;

global.pawnweapon_object[4] = obj_pawnweapon_4;
global.pawnweapon_playerindex[4] = PlayerWeapon.Grenade;

global.pawnweapon_object[5] = obj_pawnweapon_5;
global.pawnweapon_playerindex[5] = PlayerWeapon.Axe;

global.pawnweapon_object[6] = obj_pawnweapon_6;
global.pawnweapon_playerindex[6] = PlayerWeapon.Rake;

global.pawnweapon_object[7] = obj_pawnweapon_7;
global.pawnweapon_playerindex[7] = PlayerWeapon.Sledgehammer;

global.pawnweapon_object[8] = obj_pawnweapon_8;
global.pawnweapon_playerindex[8] = PlayerWeapon.SniperRifle;

global.pawnweapon_object[9] = obj_pawnweapon_9;
global.pawnweapon_playerindex[9] = PlayerWeapon.Spear;

global.pawnweapon_object[10] = obj_pawnweapon_10;
global.pawnweapon_playerindex[10] = PlayerWeapon.Flamethrower;

global.pawnweapon_object[11] = obj_pawnweapon_11;
global.pawnweapon_playerindex[11] = PlayerWeapon.Shotgun;

global.pawnweapon_object[12] = obj_pawnweapon_12;
global.pawnweapon_playerindex[12] = PlayerWeapon.Revolver;

global.pawnweapon_object[13] = obj_pawnweapon_13;
global.pawnweapon_playerindex[13] = PlayerWeapon.Katana;

global.pawnweapon_object[14] = obj_pawnweapon_14;
global.pawnweapon_playerindex[14] = PlayerWeapon.Greatsword;