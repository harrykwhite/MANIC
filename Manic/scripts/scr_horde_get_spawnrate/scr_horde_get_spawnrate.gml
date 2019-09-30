///@param level
var level = argument0;
var srate = hordespawnrate;

switch(level){
	case Level.TrainStation:
		srate += 1;
		break;
	
	case Level.DesolateVillage:
		srate += 2;
		break;
}

return srate;