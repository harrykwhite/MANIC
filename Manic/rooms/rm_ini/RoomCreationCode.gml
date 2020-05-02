randomize();
mp_potential_settings(30, 15, 3, true);

scr_global_set();
scr_input_setup();
scr_save_game_reader();

global.game_lighting = noone;
global.game_lighting_level = 1;
global.game_lighting_level_to = 1;

global.game_input_type = InputType.Keyboard;

// Enumerators
enum InputType{
	Keyboard,
	Gamepad,
}

enum GamepadType{
	Xbox,
	Playstation,
	Switch,
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

enum SoundType{
	Sound,
	Music,
	Ambience,
}

room_goto(rm_title_0);