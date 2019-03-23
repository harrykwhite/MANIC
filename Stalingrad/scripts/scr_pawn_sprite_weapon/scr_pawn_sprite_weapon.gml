///@param weapon_index
///@param botharm
///@param onearm
///@param noarm
var weaponi = argument0;
var botharm = argument1;
var onearm = argument2;
var noarm = argument3;

if (weaponi != -1){
	if (!global.weapon_heavy[weaponi]){
		sprite_index = onearm;
	}else{
		sprite_index = botharm;
	}
}else{
	sprite_index = noarm;
}