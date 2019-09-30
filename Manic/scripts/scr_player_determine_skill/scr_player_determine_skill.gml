var skill = 1;
var hmax = global.player_health_max;
var mult = global.player_health_current > (hmax / 2) ? 1 : -1;

skill += 0.025 * mult;

if (mult == 1){
	if (global.player_health_current >= hmax - 1){
		skill += 0.025 * mult;
	}
	
	if (global.player_health_current > hmax - 1){
		skill += 0.025 * mult;
	}
}else{
	if (global.player_health_current <= 2){
		skill += 0.025 * mult;
	}
	
	if (global.player_health_current < 2){
		skill += 0.025 * mult;
	}
}

return skill;