var skill = 1;
var hmax = global.player_health_max;
var mult = global.player_health_current > (hmax / 2) ? 1 : -1;

skill += 0.1 * mult;

if (mult == 1 ? global.player_health_current > hmax - 1 : global.player_health_current < 2){
	skill += 0.1 * mult;
}

return skill;