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
deer_spawn_time = 60 * random_range(8, 13);

// Other
wind = audio_play_sound(m_ambience_wind_0, 3, true);
audio_sound_gain(wind, 0, 0);
audio_sound_gain(wind, 1 * obj_controller_all.real_ambience_volume, 20000);

global.cutscene_current = 56;
sprite_index = noone;
depth = -5;

// Weapon
global.weapon_slot[0] = -1;
global.weapon_slotammo[0] = -1;
global.weapon_slotscale[0] = 1;

// Grass
var flr = layer_get_id("InteriorFloorWood");
var lflr = layer_tilemap_get_id(flr);

repeat(650){
	var xx = random(room_width);
	var yy = random(room_height);
	
	while(collision_rectangle(xx - 10, yy - 10, xx + 10, yy + 10, obj_p_solid, false, true) || collision_rectangle(xx - 10, yy - 10, xx + 10, yy + 10, obj_grass_small_0, false, true) || tilemap_get_at_pixel(lflr, xx, yy)){
		xx = random(room_width);
		yy = random(room_height);
	}
	
	instance_create(xx, yy, obj_grass_small_0);
}