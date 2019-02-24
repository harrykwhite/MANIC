scr_bonuspoints_list();
scr_weapon_list();
scr_level_list();
scr_pawn_list();
scr_cutscene_list();
scr_artifact_list();

global.game_startup = true;
global.game_pause = false;
global.game_titlescreen = false;
global.game_playthrough = false;

global.game_combat_state = CombatState.Idle;
global.game_combat_active = true;
global.game_combat_balance = 1;
global.game_level_opening_type = 0;

global.boss_current = -1;

if (room == rm_ini){
	global.game_time_passed = 0;
	global.level_current = LevelIndex.RavagedTown;
	global.player_companion = -1;
	global.player_companion_health = -1;
}

global.fade_object_group[0, 0] = noone;

global.game_score = 0;
global.game_score_bonus = 0;
global.game_score_deaths = 4000;
global.game_score_artifacts = 0;
global.game_score_wpnvariation = 0;

global.player = obj_player;
global.player_respawn_x = 0;
global.player_respawn_y = 0;

global.levelstart_weapon[0] = PlayerWeapon.Revolver;
global.levelstart_weapon[1] = -1;

global.sectionstart_weapon[0] = PlayerWeapon.Revolver;
global.sectionstart_weapon[1] = -1;
global.sectionstart_weaponammo[0] = global.weapon_ammomax[PlayerWeapon.Revolver];
global.sectionstart_weaponammo[1] = -1;
global.sectionstart_playerhealth = 0;

global.leveldata_weapon_ammo[0] = global.weapon_ammomax[PlayerWeapon.Revolver];
global.leveldata_weapon_ammo[1] = -1;

part_system_clear(global.ps_bottom);
part_system_clear(global.ps_front);

randomize();