// Enemy Pawns
global.enemy[0] = obj_enemy_0;
global.enemy[1] = obj_enemy_1;
global.enemy[2] = obj_enemy_2;
global.enemy[3] = obj_thescorched;
global.enemy[4] = obj_thedogkeeper;

// Companion Pawns
global.companion[0] = obj_companion_0;
global.companion[1] = obj_companion_1;
global.companion[2] = obj_companion_2;
global.companion[3] = obj_companion_3;

// Boss Pawns
enum Boss{
	EnemyHorde,
	MotherRobot,
	SniperRobot,
	SniperRobotBoss,
	TheScorched,
	TheDogkeeper,
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

global.boss_name[3] = "Sniper Robot Leader";
global.boss_music[3] = m_boss_main_0;
global.boss_stinger[3] = m_boss_stinger_0;

global.boss_name[4] = "The Scorched";
global.boss_music[4] = m_boss_main_0;
global.boss_stinger[4] = m_boss_stinger_0;

global.boss_name[5] = "The Dog Keeper";
global.boss_music[5] = m_boss_main_0;
global.boss_stinger[5] = m_boss_stinger_0;

// Enumerators
enum EnemyOneType{
	Ordinary,
	Fast,
	Large,
	Grenadier,
	Sniper,
	Mother,
	Crazy,
	Fly,
	SniperBoss,
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
	Shotgun,
}

// Pawn Weapons
global.pawnweapon_object[0] = obj_pawnweapon_0;
global.pawnweapon_realindex[0] = PlayerWeapon.Stick;

global.pawnweapon_object[1] = obj_pawnweapon_1;
global.pawnweapon_realindex[1] = PlayerWeapon.Crowbar;

global.pawnweapon_object[2] = obj_pawnweapon_2;
global.pawnweapon_realindex[2] = PlayerWeapon.Machete;

global.pawnweapon_object[3] = obj_pawnweapon_3;
global.pawnweapon_realindex[3] = PlayerWeapon.Knife;

global.pawnweapon_object[4] = obj_pawnweapon_4;
global.pawnweapon_realindex[4] = PlayerWeapon.Grenade;

global.pawnweapon_object[5] = obj_pawnweapon_5;
global.pawnweapon_realindex[5] = PlayerWeapon.Axe;

global.pawnweapon_object[6] = obj_pawnweapon_6;
global.pawnweapon_realindex[6] = PlayerWeapon.Rake;

global.pawnweapon_object[7] = obj_pawnweapon_7;
global.pawnweapon_realindex[7] = PlayerWeapon.Sledgehammer;

global.pawnweapon_object[8] = obj_pawnweapon_8;
global.pawnweapon_realindex[8] = PlayerWeapon.SniperRifle;

global.pawnweapon_object[9] = obj_pawnweapon_9;
global.pawnweapon_realindex[9] = PlayerWeapon.Spear;

global.pawnweapon_object[10] = obj_pawnweapon_10;
global.pawnweapon_realindex[10] = PlayerWeapon.Flamethrower;

global.pawnweapon_object[11] = obj_pawnweapon_11;
global.pawnweapon_realindex[11] = PlayerWeapon.Shotgun;