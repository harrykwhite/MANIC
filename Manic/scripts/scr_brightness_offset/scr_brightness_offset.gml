var brightness = 100 - global.game_option[| Options.Brightness];
var offset = 0;

offset = (brightness / 100) - 0.5;
offset *= 0.2;

return offset;