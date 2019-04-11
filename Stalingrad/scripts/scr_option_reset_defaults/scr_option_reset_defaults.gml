///@param type ["gameplay" "display" "audio" "controls"]
var type = argument0;

switch(type){
	case "gameplay":
		global.game_option[| Options.Screenshake] = 50;
		global.game_option[| Options.ScreenFreeze] = true;
		global.game_option[| Options.MaxCorpses] = 15;
		global.game_option[| Options.Flashing] = 100;
		break;
	
	case "display":
		global.game_option[| Options.Fullscreen] = true;
		global.game_option[| Options.Resolution] = -1;
		break;
	
	case "audio":
		global.game_option[| Options.MasterVolume] = 100;
		global.game_option[| Options.SoundVolume] = 100;
		global.game_option[| Options.MusicVolume] = 100;
		global.game_option[| Options.AmbienceVolume] = 100;
		break;
	
	case "controls":
		global.game_option[| Options.Input_MoveRight] = ord("D");
		global.game_option[| Options.Input_MoveLeft] = ord("A");
		global.game_option[| Options.Input_MoveUp] = ord("W");
		global.game_option[| Options.Input_MoveDown] = ord("S");
		global.game_option[| Options.Input_Dash] = vk_space;
		global.game_option[| Options.Input_Interact] = ord("E");
		global.game_option[| Options.Input_Attack] = mb_left;
		global.game_option[| Options.Input_Throw] = mb_right;
		break;
}

scr_options_refresh();