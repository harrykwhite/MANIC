event_inherited();
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
//mylight = noone;
sprite_set = false;
type = 0;
interact = false;
interact_break = 10;
stop_on_end = false;
is_boss = false;
leader = 0;
component = 0;

horde_dospawn = false;
horde_leader_active = false;
horde_spawn_time = 0;
horde_spawn_time_max = 60 * 5;
horde_spawn_opentime = 0;
horde_spawn_opentime_max = 60 * 2;
horde_spawn_wave = 0;

if (x >= room_width){
	dir = -1;
}