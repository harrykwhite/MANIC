var skill = 1;
var mult = global.player_health_current > 3 ? 1 : -1;

skill += 0.1 * mult;

if (mult == 1 ? global.player_health_current > 5 : global.player_health_current < 2){
	skill += 0.1 * mult;
}

return skill;