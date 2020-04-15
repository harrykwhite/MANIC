///@param index
var index = argument0;

ini_open(working_directory + "arena.ini");
ini_write_real("Highscores", "Arena" + string(index), global.level_highscore[Level.Arena_NorthernFarmhouse + index]);
ini_close();