///@param x
///@param y
var xx = argument0;
var yy = argument1;
var r = noone;
var singular_ceiling = false;

var list, length, inst;

switch(global.level_current){
	case 1:
		list[0] = obj_farmbuilding_0;
		list[1] = obj_farmbuilding_1;
		list[2] = obj_farmbuilding_2;
		list[3] = obj_farmbuilding_3;
		break;

	case 3:
		list[0] = obj_snowbuilding_0;
		list[1] = obj_snowbuilding_1;
		list[2] = obj_snowbuilding_2;
		list[3] = obj_snowbuilding_3;
		list[4] = obj_snowbuilding_4;
		list[5] = obj_snowbuilding_5;
		break;
	
	case 5:
		list[0] = obj_snowbuilding_0;
		list[1] = obj_snowbuilding_1;
		list[2] = obj_snowbuilding_2;
		list[3] = obj_snowbuilding_3;
		list[4] = obj_snowbuilding_4;
		list[5] = obj_snowbuilding_5;
		break;
	
	case 8:
		list[0] = obj_citybuilding_0;
		list[1] = obj_citybuilding_1;
		list[2] = obj_citybuilding_2;
		list[3] = obj_citybuilding_3;
		list[4] = obj_citybuilding_4;
		list[5] = obj_citybuilding_5;
		list[6] = obj_citybuilding_6;
		singular_ceiling = true;
		break;
	
	default:
		list[0] = obj_destroyedbuilding_0;
		list[1] = obj_destroyedbuilding_1;
		list[2] = obj_destroyedbuilding_2;
		break;
}

length = array_length_1d(list);

for(var i = 0; i < length; i++){
	inst = instance_place(xx, yy - 4, list[i]);
	
	if (singular_ceiling){
	}
	
	if (inst != noone){
		r = inst;
		break;
	}
}

return r;