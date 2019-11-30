dir = 1;
spd = 4;
component_spawn = false;
count = -1;
cutscene_opening_count = 1;
explode = 60 * 18;
mainsprite = noone;
leave = false;
open = false;
open_time = 0;
open_pause = false;
open_set = false;
close = false;
sprite_set = false;
interact = false;
interact_break = 10;
stop_on_end = false;
is_boss = false;
leader = 0;
component = 0;
mylight = noone;
hitbox = noone;

for(var i = 0; i < 18; i ++){
	boss_entity[i] = noone;
}

switch(room){
	case rm_level_1_00:
		type = 1;
		break;
	
	case rm_level_4_00:
		type = 0;
		break;
	
	case rm_level_6_00:
		type = 0;
		break;
	
	case rm_level_6_01:
		type = 0;
}

horde_dospawn = false;
horde_spawn_time = 60;
horde_spawn_time_max = 60 * 2;
horde_spawn_opentime = 0;
horde_spawn_opentime_max = 60 * 2;
horde_spawn_wave = 0;

if (x >= room_width){
	dir = -1;
}