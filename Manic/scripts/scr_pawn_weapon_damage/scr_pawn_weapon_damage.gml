///@param base
var base = argument0;
var add = 1;

if (global.level_current < Level.HumanPrison){
	add = 0;
	
	if (global.level_current <= Level.RavagedTown){
		add = -1;
	}
}

return max(1, base + add);