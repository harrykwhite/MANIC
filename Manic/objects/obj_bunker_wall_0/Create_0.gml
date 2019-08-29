var lvl = scr_level_get_index(room);

switch(lvl){
	case Level.HumanPrison:
		sprite_index = spr_bunker_wall_0_prison;
		break;
	
	case Level.CityHeadquarters:
		sprite_index = spr_bunker_wall_0_wood;
		break;
}