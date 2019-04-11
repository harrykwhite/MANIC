var mastvolume = global.game_option[| Options.MasterVolume];
var sndvolume = global.game_option[| Options.SoundVolume];
var musvolume = global.game_option[| Options.MusicVolume];
var ambvolume = global.game_option[| Options.AmbienceVolume];

var master = mastvolume / 100;
real_sound_volume = (sndvolume / 100) * master;
real_music_volume = (musvolume / 100) * master;
real_ambience_volume = (ambvolume / 100) * master;