///@param type ["gameplay" "display" "audio" "controls"]
var type = argument0;

switch(type){
	case "gameplay":
		global.game_option[| Options.Screenshake] = 50;
		global.game_option[| Options.ScreenFreeze] = true;
		global.game_option[| Options.QuickZoom] = 100;
		global.game_option[| Options.MaxCorpses] = 15;
		global.game_option[| Options.Flashing] = 100;
		break;
	
	case "display":
		global.game_option[| Options.Fullscreen] = true;
		global.game_option[| Options.Resolution] = -1;
		global.game_option[| Options.WindowScale] = 3;
		global.game_option[| Options.CameraScale] = 1;
		global.game_option[| Options.UIScale] = 1;
		break;
	
	case "audio":
		global.game_option[| Options.MasterVolume] = 100;
		global.game_option[| Options.SoundVolume] = 50;
		global.game_option[| Options.MusicVolume] = 70;
		global.game_option[| Options.AmbienceVolume] = 40;
		break;
	
	case "controls":
		global.game_option[| Options.Input_MoveRight] = scr_input_get_default(Options.Input_MoveRight);
		global.game_option[| Options.Input_MoveLeft] = scr_input_get_default(Options.Input_MoveLeft);
		global.game_option[| Options.Input_MoveUp] = scr_input_get_default(Options.Input_MoveUp);
		global.game_option[| Options.Input_MoveDown] = scr_input_get_default(Options.Input_MoveDown);
		global.game_option[| Options.Input_Dash] = scr_input_get_default(Options.Input_Dash);
		global.game_option[| Options.Input_Interact] = scr_input_get_default(Options.Input_Interact);
		global.game_option[| Options.Input_Attack] = scr_input_get_default(Options.Input_Attack);
		global.game_option[| Options.Input_Throw] = scr_input_get_default(Options.Input_Throw);
		break;
}

scr_options_refresh(type == "display");