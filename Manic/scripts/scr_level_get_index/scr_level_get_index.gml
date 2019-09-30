///@param room
var rm = argument0;

switch(rm){
	case rm_prologue_00:
		return Level.Prologue;
		break;
	
	case rm_level_1_00:
		return Level.RavagedTown;
		break;
	
	case rm_level_1_01:
		return Level.RavagedTown;
		break;
	
	case rm_level_2_pre_00:
		return Level.WesternFarmland;
		break;
	
	case rm_level_2_00:
		return Level.WesternFarmland;
		break;
	
	case rm_level_2_01:
		return Level.WesternFarmland;
		break;
	
	case rm_level_2_02:
		return Level.WesternFarmland;
		break;
	
	case rm_level_2_03:
		return Level.WesternFarmland;
		break;
	
	case rm_level_2_04:
		return Level.WesternFarmland;
		break;
	
	case rm_level_2_post_00:
		return Level.WesternFarmland;
		break;
	
	case rm_level_3_00:
		return Level.UndergroundBunker;
		break;
	
	case rm_level_3_01:
		return Level.UndergroundBunker;
		break;
	
	case rm_level_3_02:
		return Level.UndergroundBunker;
		break;
	
	case rm_level_3_post_00:
		return Level.UndergroundBunker;
		break;
	
	case rm_level_4_pre_00:
		return Level.WinterTown;
		break;
	
	case rm_level_4_00:
		return Level.WinterTown;
		break;
	
	case rm_level_4_01:
		return Level.WinterTown;
		break;
	
	case rm_level_4_02:
		return Level.WinterTown;
		break;
	
	case rm_level_4_03:
		return Level.WinterTown;
		break;
	
	case rm_level_4_post_00:
		return Level.WinterTown;
		break;
	
	case rm_level_4_post_01:
		return Level.WinterTown;
		break;
	
	case rm_level_5_00:
		return Level.HumanPrison;
		break;
	
	case rm_level_5_01:
		return Level.HumanPrison;
		break;
	
	case rm_level_5_02:
		return Level.HumanPrison;
		break;
	
	case rm_level_5_03:
		return Level.HumanPrison;
		break;
	
	case rm_level_5_04:
		return Level.HumanPrison;
		break;
	
	case rm_level_5_post_00:
		return Level.HumanPrison;
		break;
	
	case rm_level_6_pre_00:
		return Level.TrainStation;
		break;
	
	case rm_level_6_00:
		return Level.TrainStation;
		break;
	
	case rm_level_6_01:
		return Level.TrainStation;
		break;
	
	case rm_level_6_02:
		return Level.TrainStation;
		break;
	
	case rm_level_7_00:
		return Level.TheCemetery;
		break;
	
	case rm_level_7_01:
		return Level.TheCemetery;
		break;
	
	case rm_level_7_02:
		return Level.TheCemetery;
		break;
	
	case rm_level_7_03:
		return Level.TheCemetery;
		break;
	
	case rm_level_7_post_00:
		return Level.TheCemetery;
		break;
	
	case rm_level_8_00:
		return Level.DesolateVillage;
		break;
	
	case rm_level_8_01:
		return Level.DesolateVillage;
		break;
	
	case rm_level_8_02:
		return Level.DesolateVillage;
		break;
	
	case rm_level_8_post_00:
		return Level.DesolateVillage;
		break;
	
	case rm_level_9_00:
		return Level.IntoTheCity;
		break;
	
	case rm_level_9_01:
		return Level.IntoTheCity;
		break;
	
	case rm_level_9_02:
		return Level.IntoTheCity;
		break;
	
	case rm_level_10_00:
		return Level.CityHeadquarters;
		break;
	
	case rm_level_10_01:
		return Level.CityHeadquarters;
		break;
	
	default:
		show_debug_message("A level room has not been included in scr_level_get_index");
		return 0;
}