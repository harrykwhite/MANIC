event_inherited();
dir = 1;
spd = 4;
component_spawn = false;
count = 0;
cutscene_opening_count = 2;
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

if (x >= room_width){
	dir = -1;
}