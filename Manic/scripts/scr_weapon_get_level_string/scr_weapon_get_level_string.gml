///@param level
var level = argument0;

switch(level){
	case WeaponLevel.VeryLow: return "Very Low";
	case WeaponLevel.Low: return "Low";
	case WeaponLevel.Average: return "Average";
	case WeaponLevel.High: return "High";
	case WeaponLevel.VeryHigh: return "Very High";
}

return "";