///@param base
var base = argument0;
var add = 1;

switch(global.level_current){
	case 0: add = -1; break;
	case 1: add = 0; break;
	case 2: add = 0; break;
}

return max(1, base + add);