///@param x
///@param y
var xx = argument0;
var yy = argument1;

if (global.level_current == Level.UndergroundBunker) || (global.level_current == Level.HumanPrison){
	return false;
}

return place_meeting(xx, yy, obj_farmbuilding_3)
|| place_meeting(xx, yy, obj_farmbuilding_4)
|| place_meeting(xx, yy, obj_snowbuilding_6)
|| place_meeting(xx, yy, obj_snowbuilding_7)
|| place_meeting(xx, yy, obj_destroyedbuilding_3)
|| place_meeting(xx, yy, obj_citybuilding_3)
|| place_meeting(xx, yy, obj_bunkerbuilding_4)
|| place_meeting(xx, yy, obj_bunkerbuilding_5)
|| place_meeting(xx, yy, obj_bunkerbuilding_6)
|| place_meeting(xx, yy, obj_prisonbuilding_6)
|| place_meeting(xx, yy, obj_prisonbuilding_7);