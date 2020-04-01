///@param room
var rm = argument0;

switch(rm){
	case rm_level_1_01:
	case rm_level_2_pre_00:
	case rm_level_2_03:
	case rm_level_2_04:
	case rm_level_2_post_00:
	case rm_level_3_post_00:
	case rm_level_4_pre_00:
	case rm_level_4_02:
	case rm_level_4_post_00:
	case rm_level_4_post_01:
	case rm_level_5_post_00:
	case rm_level_6_pre_00:
	case rm_level_7_post_00:
	case rm_level_8_post_00:
		return true;
		break;
	
	default:
		return false;
		break;
}