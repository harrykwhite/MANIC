///@param x
///@param y
var xx = argument0;
var yy = argument1;
var r = noone;

var list, length, inst;

switch(global.level_current){
	case 1:
		list[0] = obj_farmbuilding_4;
		list[1] = obj_farmbuilding_5;
		break;

	case 3:
		list[0] = obj_snowbuilding_6;
		list[1] = obj_snowbuilding_7;
		list[2] = obj_snowbuilding_10;
		break;
	
	case 5:
		list[0] = obj_snowbuilding_6;
		list[1] = obj_snowbuilding_7;
		list[2] = obj_snowbuilding_10;
		break;
	
	default:
		list[0] = obj_destroyedbuilding_3;
		list[1] = obj_destroyedbuilding_4;
		break;
}

length = array_length_1d(list);

for(var i = 0; i < length; i++){
	
	inst = instance_place(xx, yy, list[i]);
	
	if (inst != noone){
		
		r = inst;
		break;
	}
}

return r;