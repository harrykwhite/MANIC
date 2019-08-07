///@param index
var index = argument0;

switch(index){
	case Options.Input_MoveRight: return ord("D");
	case Options.Input_MoveLeft: return ord("A");
	case Options.Input_MoveUp: return ord("W");
	case Options.Input_MoveDown: return ord("S");
	case Options.Input_Dash: return vk_space;
	case Options.Input_Interact: return ord("E");
	case Options.Input_Attack: return mb_left;
	case Options.Input_Throw: return mb_right;
}

return 0;