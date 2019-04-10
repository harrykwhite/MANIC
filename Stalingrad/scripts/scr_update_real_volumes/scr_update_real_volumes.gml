var master = global.game_option[| Options.MasterVolume] / 100;
real_sound_volume = (global.game_option[| Options.SoundVolume] / 100) * master;
real_music_volume = (global.game_option[| Options.MusicVolume] / 100) * master;
real_ambience_volume = (global.game_option[| Options.AmbienceVolume] / 100) * master;