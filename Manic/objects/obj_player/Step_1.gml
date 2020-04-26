global.player_health_previous = global.player_health_current;

// Upgrades
if (!upgrades_set){
	if (scr_level_is_arena()){
		scr_player_upgrade_update();
	}
	
	scr_player_upgrade_refresh();
	scr_player_upgrade_light();
	
	surrounding_light = surrounding_light_to;
	upgrades_set = true;
}

scr_player_upgrade_light();

// Default weapon
if (!global.weapon_default_set){
	if (!global.game_is_playthrough){
		var def = PlayerWeapon.Knife;
		
		if (!scr_level_is_arena()){
			if (global.level_current == Level.Prologue){
				def = -1;
			}
		
			if (global.level_current >= Level.HumanPrison){
				def = PlayerWeapon.Bayonet;
			}
		}else{
			if (global.level_current == Level.Arena_PrisonBase){
				def = PlayerWeapon.Bayonet;
			}
		}
		
		global.weapon_default = def;
	}
	
	global.weapon_default_set = true;
}