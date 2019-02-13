///@param attack_time
///@param type
attack_time_max = argument0;
type = argument1;

destroy = false;

attack = false;

dir = 0;

alpha = 0;
alphaTo = 0;

player_cast = false;

throw_offset = 0;

attack_active = false;
attack_return = false;
attack_time = floor(attack_time_max * 0.75);
attack_round = 0;
attack_range = 0;
attack_offset = 0;

attack_delay = 0;
attack_delay_active = false;
attack_delay_x = 0;
attack_delay_y = 0;
attack_delay_xpos = 0;
attack_delay_ypos = 0;
attack_delay_dir = 0;

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