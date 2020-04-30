global.game_level_arena_unlocked[0] = ini_read_real("Options", "ArenaUnlocked0", true);
global.game_level_arena_unlocked[1] = ini_read_real("Options", "ArenaUnlocked1", false);
global.game_level_arena_unlocked[2] = ini_read_real("Options", "ArenaUnlocked2", false);

if (global.game_levelselect_unlocked){
	global.game_level_arena_unlocked[0] = true;
	global.game_level_arena_unlocked[1] = true;
	global.game_level_arena_unlocked[2] = true;
}

scr_arena_write_unlock();