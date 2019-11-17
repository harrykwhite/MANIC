///@param level
var level = argument0;
var srate = hordespawnrate;

switch(level){
	case Level.TrainStation:
		srate += 0.5;
		break;
	
	case Level.DesolateVillage:
		srate += 1;
		break;
}

return srate;