scr_global_set();
display_set_gui_size(1920, 1080);

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

room_goto(rm_title_0);