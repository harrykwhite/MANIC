var mysprite = spr_pawn_minecart_0;
visible = true;

if (instance_exists(global.player)){
	// Movement
	if (!global.player.in_minecart){
		if (image_index < sprite_get_number(sprite_index)){
			image_index += sprite_get_speed(sprite_index);
		}else{
			image_index = 0;
		}

		if (minecart_speed > 0){
			minecart_speed -= 0.005;
		}

		if (minecart_speed < 0){
			minecart_speed += 0.005;
		}

		if (minecart_bounce_break > 0){
			minecart_bounce_break --;
		}else{
			var cartx = sprite_get_bbox_left(sprite_index);
			var carty = sprite_get_bbox_top(sprite_index);
			var cartw = sprite_get_bbox_right(sprite_index) - cartx;
			var carth = sprite_get_bbox_bottom(sprite_index) - carty;

			var mblocklist = ds_list_create();
			var mblocktotal = collision_rectangle_list(x - (sprite_width / 2) + cartx, y - (sprite_height/ 2) + carty, x - (sprite_width / 2) + cartx + cartw, y - (sprite_height / 2) + carty + carth, obj_block_minecart, false, false, mblocklist, false);
			if (mblocktotal > 0){
				for(var i = 0; i < mblocktotal; i++){
					var mblock = mblocklist[| i];
			
					if (mblock.image_angle != minecart_dir){
						minecart_dir = mblock.image_angle;
						minecart_bounce_break = 15;
						break;
					}
				}
			}
		}

		if (minecart_speed != 0) || (minecart_speed != 0){
			image_speed = 1;
		}else{
			image_speed = 0;
		}

		if ((minecart_dir > 90 - 20) && (minecart_dir < 90 + 20)) || ((minecart_dir > 270 - 20) && (minecart_dir < 270 + 20)){
			mysprite = spr_pawn_minecart_1;
		}else{
			mysprite = spr_pawn_minecart_0;
		}

		x += lengthdir_x(abs(minecart_speed), minecart_dir) * sign(minecart_speed);
		y += lengthdir_y(abs(minecart_speed), minecart_dir) * sign(minecart_speed);
	}
	
	// Equip
	var pickup_range = 10;
	var pressed = keyboard_check_pressed(ord("E"));
	var isme = global.player.minecart == id;
	
	if (isme){
		x = global.player.x;
		y = global.player.y;
	}
	
	if (global.player_stamina_active){
		if (global.player.in_minecart){
			if (isme){
				visible = false;

				if (pressed){
					sprite_index = global.player.minecart_sprite;
					global.player.minecart = noone;
					global.player.minecart_sprite = noone;
					global.player.minecart_sprite_image = 0;
					global.player.in_minecart = false;
					global.player.state = scr_player_move;
					global.player.sprite_index = spr_player_idle_2;
					scr_player_stamina_drain(6);
					
					if (instance_exists(gun)){
						gun.demount = true;
					}
				}
			}
		}else{
			if (distance_to_object(global.player) < pickup_range){
				if (mysprite == spr_pawn_minecart_0){
					mysprite = spr_pawn_minecart_0_interact;
				}else if (mysprite == spr_pawn_minecart_1){
					mysprite = spr_pawn_minecart_1_interact;
				}
				
				scr_ui_control_indicate("Minecart [E]");
		
				if (instance_exists(gun)){
					gun.interact = true;
				}
			
				if (pressed){
					global.player.minecart = id;
					global.player.in_minecart = true;
					global.player.minecart_speed = minecart_speed;
					global.player.minecart_bounce_break = minecart_bounce_break;
					global.player.minecart_dir = minecart_dir;
					global.player.minecart_sprite = sprite_index;
					global.player.minecart_sprite_image = image_index;
					global.player.x = x;
					global.player.y = y;
					scr_player_stamina_drain(6);
					if (instance_exists(gun)){
						gun.interact_activate = true;
					}
				}
			}
		}
	}
}

sprite_index = mysprite;