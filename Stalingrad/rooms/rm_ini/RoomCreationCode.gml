scr_global_set();

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