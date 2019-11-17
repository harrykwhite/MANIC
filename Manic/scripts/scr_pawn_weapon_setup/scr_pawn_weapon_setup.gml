///@param attack_time
///@param type
attack_time_max = argument0;
type = argument1;

attack = false;

dir = 0;

throw_offset = 0;

attack_active = false;
attack_return = false;
attack_time = floor(attack_time_max * 0.75);
attack_range = 0;
attack_offset = 0;

flicker = false;
flicker_draw = false;
flicker_time = 0;
flicker_time_max = 10;

angle_offset = 0;
angle_offset_current = 0;

if (type == WeaponType.Melee){
	angle_offset = -90;
}

var length = array_length_1d(global.pawnweapon_object);

for(var i = length - 1; i > -1; i--){
	
	if (object_index == global.pawnweapon_object[i]){
		index = i;
		break;
	}
}

image_index = 0;
image_speed = 0;