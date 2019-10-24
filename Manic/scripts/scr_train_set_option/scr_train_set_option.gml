/*///@param num
///@param displayname
///@param levelto
///@param roomto
var num = argument0;
var displayname = argument1;
var levelto = argument2;
var roomto = argument3;

obj_controller_ui.pausedialogue_type_option[num] = displayname;
obj_controller_ui.pausedialogue_type_option_scale[num] = 1;
obj_controller_ui.pausedialogue_type_option_cutscene[num] = 51;
obj_controller_ui.pausedialogue_type_option_traingoto[num] = levelto;
obj_controller_ui.pausedialogue_type_option_trainroom[num] = roomto;
obj_controller_ui.pausedialogue_type_option_special[num] = -1;

var type = 0;

switch(roomto){
	case rm_level_1_00:
		type = 2;
		break;
	
	case rm_level_4_00:
		type = 1;
		break;
	
	case rm_level_6_00:
		type = 1;
		break;
}

obj_controller_ui.pausedialogue_type_option_trainstart_type[num] = type;*/