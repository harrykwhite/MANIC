event_inherited();
dir = 1;
spd = 6;
component_spawn = false;
type = 0;
sprite_set = false;
mylight = noone;
hitbox = noone;

sound_left = true;
sound_handler = false;
sound_start_played = false;
sound_loop_played = false;
sound_loop_inst = noone;
sound_loop_type = noone;
sound_loop_faded = false;
sound_end_played = false;

if (x >= room_width){
	dir = -1;
}