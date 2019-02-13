///@param include_fly
var include_fly = argument0;
var length = array_length_1d(global.enemy)
var count = 0;

for(var i = 0; i < length; i++){
	if (i == 1){
		if (!include_fly){
			continue;
		}
	}
	
	count += instance_number(global.enemy[i]);
}

return count;