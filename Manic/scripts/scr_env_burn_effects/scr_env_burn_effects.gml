///@param xrange
///@param yoff
///@param xrange
///@param yrange
///@param srange
var xoff = argument0;
var yoff = argument1;
var xrange = argument2;
var yrange = argument3;
var srange = argument4;

if (global.game_pause){
	return;
}

if (random(9) < 1){
	part_particles_create(global.ps_front, x + xoff + random_range(-xrange, xrange), y + yoff - 16 + random_range(-yrange, yrange), global.pt_smoke_3, 1);
}

if (random(10) < 1){
	part_particles_create(global.ps_front, x + xoff + random_range(-xrange, xrange), y + yoff - 7 + random_range(-yrange, yrange), global.pt_fire_large_0, 1);
}

if (burn_sound == noone){
	burn_sound = scr_sound_play(snd_character_burn_0, true, 1, 1);
}

scr_sound_set_distance(burn_sound, srange);