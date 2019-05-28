var level;

switch(room){
	case rm_level_1_00:
		level = obj_controller_levelone;
		break;
	
	case rm_level_2_pre_00:
		level = obj_controller_leveltwo;
		break;
	
	case rm_level_2_00:
		level = obj_controller_leveltwo;
		break;
	
	case rm_level_2_01:
		level = obj_controller_leveltwo;
		break;
	
	case rm_level_2_02:
		level = obj_controller_leveltwo;
		break;
	
	case rm_level_2_post_00:
		level = obj_controller_leveltwo;
		break;
	
	case rm_level_3_00:
		level = obj_controller_levelthree;
		break;
	
	case rm_level_3_01:
		level = obj_controller_levelthree;
		break;
	
	case rm_level_3_02:
		level = obj_controller_levelthree;
		break;
	
	case rm_level_4_00:
		level = obj_controller_levelfour;
		break;
	
	case rm_level_4_01:
		level = obj_controller_levelfour;
		break;
	
	case rm_level_5_00:
		level = obj_controller_levelfive;
		break;
	
	case rm_level_5_01:
		level = obj_controller_levelfive;
		break;
	
	case rm_level_5_02:
		level = obj_controller_levelfive;
		break;
	
	case rm_level_5_03:
		level = obj_controller_levelfive;
		break;
	
	case rm_level_5_04:
		level = obj_controller_levelfive;
		break;
	
	case rm_level_6_pre_00:
		level = obj_controller_levelsix;
		break;
	
	case rm_level_6_00:
		level = obj_controller_levelsix;
		break;
	
	case rm_level_6_01:
		level = obj_controller_levelsix;
		break;
	
	case rm_level_7_00:
		level = obj_controller_levelseven;
		break;
	
	case rm_level_7_01:
		level = obj_controller_levelseven;
		break;
	
	case rm_level_7_02:
		level = obj_controller_levelseven;
		break;
	
	case rm_level_8_00:
		level = obj_controller_leveleight;
		break;
	
	case rm_level_8_01:
		level = obj_controller_leveleight;
		break;
	
	case rm_level_8_02:
		level = obj_controller_leveleight;
		break;
	
	case rm_level_9_00:
		level = obj_controller_levelnine;
		break;
	
	case rm_level_9_01:
		level = obj_controller_levelnine;
		break;
	
	case rm_level_9_02:
		level = obj_controller_levelnine;
		break;
	
	case rm_level_10_00:
		level = obj_controller_levelten;
		break;
	
	case rm_level_10_01:
		level = obj_controller_levelten;
		break;
	
	default:
		level = obj_controller_prologue;
		break;
}

return level;