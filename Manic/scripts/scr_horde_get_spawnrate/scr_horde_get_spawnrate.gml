///@param level
var level = argument0;
var srate = hordespawnrate;

switch(level){
	case Level.TrainStation:
		srate += 2.5;
		break;
	
	case Level.DesolateVillage:
		srate += 5;
		break;
}

return srate;