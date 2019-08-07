///@param val
///@param at
var val = argument0;
var at = argument1;

if (object_index != obj_titlescreen_main){
	return;
}

var optcount = array_length_1d(option_setting_controls_value);
var ret = false;

for(var o = 0; o < optcount; o ++){
	if (o == at){
		continue;
	}
	
	if (val == option_setting_controls_value[o]){
		ret = true;
		break;
	}
}

return ret;