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

// Locked
if (locked){
	var num = sprite_get_number(locked_img_sprite) - 1;
	
	if (locked_img < num){
		locked_img += locked_img_speed;
	}else{
		if (locked_img_alpha > 0){
			locked_img_alpha -= 0.075;
		}else{
			locked = false;
			locked_img = 0;
			locked_img_speed = 0;
			locked_img_alpha = 0;
		}
	}
	
	locked_img = clamp(locked_img, 0, num);
	interact = false;
}else{
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
}

if ((interact) && (global.cutscene_current == -1) && (!anim) && (!locked) && (id != inst_1CAF8CCE)) || (auto_interact){
	if (global.cutscene_current == -1) && (!locked){
		sprite_index = open ? openintsprite : closedintsprite;
		scr_ui_control_indicate(open ? "Close Door" : "Open Door");
	}else{
		sprite_index = open ? opensprite : closedsprite;
	}
	
	if (interact_break <= 0 || auto_interact){
		if (scr_input_is_pressed(InputBinding.Interact) && global.player_stamina_active) || (auto_interact){
			interact_break = 5;
			auto_interact = false;
			
			var bleft = x + sprite_get_bbox_left(closedsprite);
			var btop = y + sprite_get_bbox_top(closedsprite);
			var bright = x + sprite_get_bbox_right(closedsprite);
			var bbottom = y + sprite_get_bbox_bottom(closedsprite);
			
			if (collision_rectangle(bleft, btop, bright, bbottom, obj_p_pawn, false, true)){
				return;
			}
			
			scr_sound_play(snd_object_door_close_0, false, 0.8, 1.2);
			scr_sound_play(snd_object_door_open_0, false, 0.8, 1.2);
			
			open = !open;
			anim = true;
			
			scr_player_stamina_drain(4);
			
			sprite_index = open ? opensprite : closedsprite;
			image_index = 0;
			image_speed = 1;
			
			if (houseraid) && (open){
				global.cutscene_current = 3;
				houseraid = false;
			}
			
			if (object_index == obj_prisonbuilding_door_0) && (global.cutscene_current != 1){
				switch(room){
					case rm_level_4_post_01:
						global.cutscene_current = 52;
						with(obj_controller_gameplay){
							cutscene_moveto_dir = 1;
							cutscene_moveto_type = 0;
							cutscene_moveto_room = rm_level_5_00;
							cutscene_moveto_level = Level.HumanPrison;
							cutscene_moveto_instant = true;
						}
						break;
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
	instance_destroy();
    
	if (death_effects){
		scr_sound_play(snd_object_box_break_0, false, 0.8, 1.2);
	    
		scr_effect_screenshake(2);
		scr_effect_freeze(13);
		
	    repeat(10)part_particles_create(global.ps_bottom, centerx + random_range(-7, 7), centery + 10 + random_range(-3, 3), global.pt_wood_0, 1);
	}
	
	var brk = instance_create(x, y, obj_break);
	brk.sprite_index = breaksprite;
	
	if (death_effects){
		brk.shake = 3;
	}else{
		brk.shake = 0;
	}
}