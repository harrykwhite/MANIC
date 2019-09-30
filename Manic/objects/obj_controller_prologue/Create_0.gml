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
deer_spawn_time = 60 * random_range(9, 12);

// Other
endscene_initiated = false;

if (!audio_is_playing(m_ambience_wind_0)){
	audio_play_sound(m_ambience_wind_0, 3, true);
	audio_sound_gain(m_ambience_wind_0, 0, 0);
}

if (!audio_is_playing(m_ambience_birds_0)){
	audio_play_sound(m_ambience_birds_0, 3, true);
	audio_sound_gain(m_ambience_birds_0, 0, 0);
}

audio_sound_gain(m_ambience_wind_0, 1 * obj_controller_all.real_ambience_volume, 15000);
audio_sound_gain(m_ambience_birds_0, 1 * obj_controller_all.real_ambience_volume, 15000);

global.cutscene_current = 56;

sprite_index = noone;
depth = -5;

// Weapon
global.weapon_slot[0] = -1;
global.weapon_slotammo[0] = -1;
global.weapon_slotscale[0] = 1;

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

repeat(700){
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

repeat(90){
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