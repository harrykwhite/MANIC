if (global.pers_runthrough){
	instance_deactivate_object(object_index);
	return;
}

// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

// Spawn
spawn_x = 640;
spawn_y = 480;
spawn_pause_update = false;

deer_can_spawn = false;
deer_spawn_time_max = 60 * random_range(7, 9);
deer_spawn_time = deer_spawn_time_max;

// Other
companions_spawned = false;
endscene_initiated = false;
hunting = false;
endscene_music_mult = 0;
endscene_music_mult_increase = 0.025;

global.cutscene_current = 56;

sprite_index = noone;
depth = -5;

// Weapon
global.weapon_slot[0] = -1;
global.weapon_slotammo[0] = -1;
global.weapon_slotscale[0] = 1;

// Music Layers
tutmusic_layer0 = audio_play_sound(m_tutourial_layer_0, 3, true);
tutmusic_layer1 = audio_play_sound(m_tutourial_layer_1, 3, true);
tutmusic_endstinger = noone;

audio_sound_gain(tutmusic_layer0, 0, 0);
audio_sound_gain(tutmusic_layer1, 0, 0);

// Environmentals
var xx, yy;

var flr = layer_get_id("InteriorFloorWood");
var lflr = layer_tilemap_get_id(flr);

var fence_x1 = 266;
var fence_y1 = 902;
var fence_x2 = 644;
var fence_y2 = 1394;

var crange = 13;

var oldx = 0;
var oldy = 0;

repeat(660){
	do{
		xx = random(room_width);
		yy = random(room_height);
	
		if (random(4) < 1){
			xx = oldx + random_range(-20, 20);
			yy = oldy + random_range(-20, 20);
		}
	}until (!collision_rectangle(xx - crange, yy - crange, xx + crange, yy + crange, obj_p_solid, false, true)
	&& !collision_rectangle(xx - crange, yy - crange, xx + crange, yy + crange, obj_grass_small_1, false, true)
	&& !collision_rectangle(xx - crange, yy - crange, xx + crange, yy + crange, obj_grass_bush_0, false, true)
	&& !collision_rectangle(xx - crange, yy - crange, xx + crange, yy + crange, obj_weapondrop, false, true)
	&& !collision_rectangle(xx - crange, yy - crange, xx + crange, yy + crange, obj_grass_bush_0, false, true)
	&& !tilemap_get_at_pixel(lflr, xx, yy)
	&& (xx < fence_x1 || xx > fence_x2 || yy < fence_y1 || yy > fence_y2));
	
	oldx = xx;
	oldy = yy;
	
	instance_create(xx, yy, obj_grass_small_1);
}

oldx = 0;
oldy = 0;

repeat(80){
	do{
		xx = random(room_width);
		yy = random(room_height);
	
		if (random(8) < 1){
			xx = oldx + random_range(-20, 20);
			yy = oldy + random_range(-20, 20);
		}
	}until (!collision_rectangle(xx - crange, yy - crange, xx + crange, yy + crange, obj_p_solid, false, true)
	&& !collision_rectangle(xx - crange, yy - crange, xx + crange, yy + crange, obj_grass_small_1, false, true)
	&& !collision_rectangle(xx - crange, yy - crange, xx + crange, yy + crange, obj_rock_small_0, false, true)
	&& !collision_rectangle(xx - crange, yy - crange, xx + crange, yy + crange, obj_grass_bush_0, false, true)
	&& !collision_rectangle(xx - crange, yy - crange, xx + crange, yy + crange, obj_weapondrop, false, true)
	&& !collision_rectangle(xx - crange, yy - crange, xx + crange, yy + crange, obj_grass_bush_0, false, true)
	&& !tilemap_get_at_pixel(lflr, xx, yy)
	&& (xx < fence_x1 || xx > fence_x2 || yy < fence_y1 || yy > fence_y2));
	
	oldx = xx;
	oldy = yy;
	
	instance_create(xx, yy, obj_rock_small_0);
}