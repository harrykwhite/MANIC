///@param music{"main","windy","underground","city"}
///@param spawnrate
var music = argument0;
var srate = argument1;
var combat_0, combat_1, combat_2, stinger_2;

switch(music){
	default:
		combat_0 = m_combat_main_0;
		combat_1 = m_combat_main_1;
		combat_2 = m_combat_main_2;
		stinger_2 = m_combat_stinger_2_main;
		break;
	
	case "windy":
		combat_0 = m_combat_windy_0;
		combat_1 = m_combat_windy_1;
		combat_2 = m_combat_windy_2;
		stinger_2 = m_combat_stinger_2_windy;
		break;
	
	case "underground":
		combat_0 = m_combat_underground_0;
		combat_1 = m_combat_underground_1;
		combat_2 = m_combat_underground_2;
		stinger_2 = m_combat_stinger_2_underground;
		break;
	
	case "city":
		combat_0 = m_combat_city_0;
		combat_1 = m_combat_city_1;
		combat_2 = m_combat_city_2;
		stinger_2 = m_combat_stinger_2_city;
		break;
}

spawn_interval[CombatState.Idle] = 9 / srate;
spawn_state_time[CombatState.Idle] = 35;
spawn_max[CombatState.Idle] = round(2 * srate);
spawn_music_stinger[CombatState.Idle] = m_combat_stinger_0;
spawn_music_main[CombatState.Idle] = combat_0;
spawn_music_pause_gain[CombatState.Idle] = 0;
spawn_music_pause_position[CombatState.Idle] = 0;

spawn_interval[CombatState.Buildup] = 5 / srate;
spawn_state_time[CombatState.Buildup] = 20;
spawn_max[CombatState.Buildup] = round(3 * srate);
spawn_music_stinger[CombatState.Buildup] = m_combat_stinger_1;
spawn_music_main[CombatState.Buildup] = combat_1;
spawn_music_pause_gain[CombatState.Buildup] = 0;
spawn_music_pause_position[CombatState.Buildup] = 0;

spawn_interval[CombatState.Climax] = 1.5 / srate;
spawn_state_time[CombatState.Climax] = 25;
spawn_max[CombatState.Climax] = round(6 * srate);
spawn_music_stinger[CombatState.Climax] = stinger_2;
spawn_music_main[CombatState.Climax] = combat_2;
spawn_music_pause_gain[CombatState.Climax] = 0;
spawn_music_pause_position[CombatState.Climax] = 0;

spawn_time = spawn_interval[global.game_combat_state];

global.game_combat_in_hordechallenge = false;
global.game_combat_in_hordechallenge_time = 0;

if (global.game_combat_state == CombatState.Idle){
	spawn_time = 60 * 8;
}