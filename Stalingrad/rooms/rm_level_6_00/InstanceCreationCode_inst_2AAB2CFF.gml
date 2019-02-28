component_spawn = true;
spd = 1;
if (global.worldtrain_room != room) || (global.game_level_opening_type == 1) or (!global.game_boss_trainhorde_killed){
	instance_destroy();
}