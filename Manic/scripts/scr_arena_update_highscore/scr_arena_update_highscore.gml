///@param index
var index = argument0;
var level = Level.Arena_NorthernFarmhouse + index;

if (global.level_score[level] > global.level_highscore[level]){
	global.level_highscore[level] = global.level_score[level];
}