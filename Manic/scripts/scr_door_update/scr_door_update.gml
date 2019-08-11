///@param opensprite
///@param openintsprite
///@param closedsprite
///@param closedintsprite
///@param breaksprite
var opensprite = argument0;
var openintsprite = argument1;
var closedsprite = argument2;
var closedintsprite = argument3;
var breaksprite = argument4;

if (global.game_pause){
	return;
}

var player = obj_player;
var centerx = x + (sprite_width / 2);
var centery = y + (sprite_height / 2);

// Interact
if (instance_exists(player)){
	if (point_distance(centerx, centery - 4, player.x, player.y) < 37){
		interact = true;
	}else{
		interact = false;
	}
}else{
	interact = false;
}

if (interact && global.cutscene_current == -1 && !anim) || (auto_interact){
	if (global.cutscene_current == -1){
		sprite_index = open ? openintsprite : closedintsprite;
		scr_ui_control_indicate(open ? "Close Door" : "Open Door");
	}else{
		sprite_index = open ? opensprite : closedsprite;
	}
	
	if (interact_break <= 0 || auto_interact){
		if (keyboard_check_pressed(obj_controller_all.key_interact) && global.player_stamina_active) || (auto_interact){
			var bleft = x + sprite_get_bbox_left(closedsprite);
			var btop = y + sprite_get_bbox_top(closedsprite);
			var bright = x + sprite_get_bbox_right(closedsprite);
			var bbottom = y + sprite_get_bbox_bottom(closedsprite);
			
			if (collision_rectangle(bleft, btop, bright, bbottom, obj_p_pawn, false, true)){
				return;
			}
			
			scr_effect_screenshake(1);
			scr_player_stamina_drain(4);
			
			scr_sound_play(snd_object_door_close_0, false, 0.8, 1.2);
			scr_sound_play(snd_object_door_open_0, false, 0.8, 1.2);
			
			interact_break = 5;
			open = !open;
			auto_interact = false;
			anim = true;
			
			sprite_index = open ? opensprite : closedsprite;
			image_speed = 1;
			image_index = 0;
			
			if (object_index == obj_prisonbuilding_door_0 && room == rm_level_6_pre_00){
				global.cutscene_current = 52;
				with(obj_controller_gameplay){
					cutscene_moveto_dir = 1;
					cutscene_moveto_type = 1;
					cutscene_moveto_room = rm_level_5_post_00;
					cutscene_moveto_level = Level.HumanPrison;
					cutscene_moveto_instant = true;
				}
			}
		}
	}else{
		interact_break --;
	}
}else{
	sprite_index = open ? opensprite : closedsprite;
}

if (!anim){
	image_index = image_number - 1;
	image_speed = 0;
}

// Flash
flash -= 0.15;
flash = clamp(flash, 0, 1);

// Hit Control
if (hit <= 0){
	death = true;
}

if (hit_time > 0){
	hit_time--;
}

// Object Death
if (death){
	scr_sound_play_distance_pitch(snd_object_box_break_0, false, 240, 0.8, 1.2);
    instance_destroy();
    
	scr_effect_screenshake(3);
	scr_effect_freeze(13);
	scr_effect_vignette_flash(c_ltgray, 0.1, 0.01);
	
    repeat(10)part_particles_create(global.ps_bottom, centerx + random_range(-7, 7), centery + 10 + random_range(-3, 3), global.pt_wood_0, 1);
	
	var brk = instance_create(x, y, obj_break);
	brk.shake = 3;
	brk.sprite_index = breaksprite;
}