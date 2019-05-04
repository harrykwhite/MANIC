scr_global_set();
scr_save_game_reader();

// Enumerators
enum GameState{
	Developer,
	Public,
}

enum CombatState{
	Idle,
	Buildup,
	Climax,
}

enum PawnType{
	Enemy,
	Boss,
	Companion,
}

enum Grade{
    EMinus,
    E,
    EPlus,
    DMinus,
    D,
    DPlus,
    CMinus,
    C,
    CPlus,
    BMinus,
    B,
    BPlus ,
    AMinus,
    A ,
    APlus,
	S,
}

enum SoundType{
	Sound,
	Music,
	Ambience,
}

room_goto(rm_title_0);