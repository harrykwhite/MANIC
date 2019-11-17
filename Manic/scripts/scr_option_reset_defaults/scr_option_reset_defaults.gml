///@param type ["gameplay" "display" "audio" "controls"]
var type = argument0;

switch(type){
	case "gameplay":
		global.game_option[| Options.Screenshake] = 50;
		global.game_option[| Options.ScreenFreeze] = true;
		global.game_option[| Options.QuickZoom] = 100;
		global.game_option[| Options.MaxCorpses] = 15;
		global.game_option[| Options.Flashing] = 100;
		global.game_option[| Options.Brightness] = 50;
		global.game_option[| Options.ShowMinimap] = true;
		break;
	
	case "display":
		global.game_option[| Options.Fullscreen] = false;
		global.game_option[| Options.Resolution] = -1;
		global.game_option[| Options.WindowScale] = 3;
		global.game_option[| Options.CameraScale] = 1;
		global.game_option[| Options.UIScale] = 1;
		break;
	
	case "audio":
		global.game_option[| Options.MasterVolume] = 100;
		global.game_option[| Options.SoundVolume] = 50;
		global.game_option[| Options.MusicVolume] = 70;
		global.game_option[| Options.AmbienceVolume] = 70;
		break;
}

scr_options_refresh(type == "display");