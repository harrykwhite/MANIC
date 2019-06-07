component_spawn = true;
spd = 1;

if (!global.game_is_playthrough) || (global.worldtrain_room != room) || (global.game_level_opening_type == 1){
	instance_destroy();
}