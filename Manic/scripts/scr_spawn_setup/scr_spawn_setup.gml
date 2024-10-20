///@param music{"main","windy","underground","city"}
var music = argument0;

var lvl = scr_level_get_index(room);
var arena = scr_level_is_arena();
var srate = 1 + (0.05 * (lvl - 1));

if (arena){
	srate = 1;
}

var combat_0, combat_1, combat_2, stinger_2, hordepost_loop;

switch(music){
	default:
		combat_0 = m_combat_main_0;
		combat_1 = m_combat_main_1;
		combat_2 = m_combat_main_2;
		stinger_2 = m_combat_stinger_2_main;
		hordepost_loop = snd_object_hordepost_loop_normal;
		break;
	
	case "windy":
		combat_0 = m_combat_windy_0;
		combat_1 = m_combat_windy_1;
		combat_2 = m_combat_windy_2;
		stinger_2 = m_combat_stinger_2_windy;
		hordepost_loop = snd_object_hordepost_loop_windy;
		break;
	
	case "underground":
		combat_0 = m_combat_underground_0;
		combat_1 = m_combat_underground_1;
		combat_2 = m_combat_underground_2;
		stinger_2 = m_combat_stinger_2_underground;
		hordepost_loop = snd_object_hordepost_loop_underground;
		break;
	
	case "city":
		combat_0 = m_combat_city_0;
		combat_1 = m_combat_city_1;
		combat_2 = m_combat_city_2;
		stinger_2 = m_combat_stinger_2_city;
		hordepost_loop = snd_object_hordepost_loop_city;
		break;
}

spawn_interval[CombatState.Idle] = 20 / srate;
spawn_state_time[CombatState.Idle] = 50;
spawn_max[CombatState.Idle] = round(clamp(srate, 1, 2));
spawn_music_stinger[CombatState.Idle] = m_combat_stinger_0;
spawn_music_main[CombatState.Idle] = combat_0;
spawn_music_pause_gain[CombatState.Idle] = 0;
spawn_music_pause_position[CombatState.Idle] = 0;

spawn_interval[CombatState.Buildup] = 5 / srate;
spawn_state_time[CombatState.Buildup] = 20;
spawn_max[CombatState.Buildup] = round(clamp(3 * srate, 3, 5));
spawn_music_stinger[CombatState.Buildup] = m_combat_stinger_1;
spawn_music_main[CombatState.Buildup] = combat_1;
spawn_music_pause_gain[CombatState.Buildup] = 0;
spawn_music_pause_position[CombatState.Buildup] = 0;

spawn_interval[CombatState.Climax] = 2.5 / srate;
spawn_state_time[CombatState.Climax] = 15;
spawn_max[CombatState.Climax] = round(clamp(6 * srate, 6, 8));
spawn_music_stinger[CombatState.Climax] = stinger_2;
spawn_music_main[CombatState.Climax] = combat_2;
spawn_music_pause_gain[CombatState.Climax] = 0;
spawn_music_pause_position[CombatState.Climax] = 0;

if (arena){
	spawn_state_time[CombatState.Idle] = round(0.25 * spawn_state_time[CombatState.Idle]);
	spawn_max[CombatState.Idle] = 0;
}

spawn_time = spawn_interval[global.game_combat_state];

spawn_start_wait_max = 60 * 1.5;
spawn_start_wait = 0;

global.game_combat_in_hordechallenge = false;
global.game_combat_in_hordechallenge_time = 0;
global.game_combat_in_hordechallenge_spawnbreak = 1.5;

if (global.game_combat_state == CombatState.Idle){
	spawn_time = 60 * 5;
}

hordepost_loop_sound = hordepost_loop;
horde_spawn_rate = scr_horde_get_spawnrate(scr_level_get_index(room));