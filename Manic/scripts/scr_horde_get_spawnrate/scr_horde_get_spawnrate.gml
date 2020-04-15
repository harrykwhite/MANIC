///@param level
var level = argument0;
var srate = hordespawnrate;

switch(level){
	case Level.TrainStation:
		srate += 0.2;
		break;
	
	case Level.DesolateVillage:
		srate += 0.4;
		break;
}

return srate;