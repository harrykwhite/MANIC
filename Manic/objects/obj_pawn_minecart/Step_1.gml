if (global.game_pause){
	return;
}

var mysprite = spr_pawn_minecart_0;
visible = true;

if (instance_exists(obj_player)){
	
	// Equip
	var pickup_range = 10;
	var pressed = scr_input_is_pressed(InputBinding.Interact);
	var isme = obj_player.minecart == id;
	var mustdemount = (global.cutscene_current != -1);
	
	if (isme){
		x = obj_player.x;
		y = obj_player.y;
	}
	
	if (global.player_stamina_active || mustdemount){
		if (obj_player.in_minecart){
			if (isme){
				visible = false;
				
				scr_ui_control_indicate("Demount Minecart");

				if (pressed) || (mustdemount){
					sprite_index = obj_player.minecart_sprite;
					obj_player.minecart = noone;
					obj_player.minecart_sprite = noone;
					obj_player.minecart_sprite_image = 0;
					obj_player.in_minecart = false;
					obj_player.state = scr_player_move;
					obj_player.sprite_index = spr_player_idle_2;
					scr_player_stamina_drain(6);
					
					if (instance_exists(gun)){
						gun.demount = true;
					}
				}
			}
		}else if (global.cutscene_current == -1){
			if (distance_to_object(obj_player) < pickup_range){
				if (mysprite == spr_pawn_minecart_0){
					mysprite = spr_pawn_minecart_0_interact;
				}else if (mysprite == spr_pawn_minecart_1){
					mysprite = spr_pawn_minecart_1_interact;
				}
				
				scr_ui_control_indicate("Minecart");
		
				if (instance_exists(gun)){
					gun.interact = true;
				}
			
				if (pressed){
					obj_player.minecart = id;
					obj_player.in_minecart = true;
					obj_player.minecart_speed = minecart_speed;
					obj_player.minecart_dir = minecart_dir;
					obj_player.minecart_sprite = sprite_index;
					obj_player.minecart_sprite_image = image_index;
					obj_player.x = x;
					obj_player.y = y;
					
					scr_player_stamina_drain(6);
					
					if (instance_exists(gun)){
						gun.interact_activate = true;
					}
				}
			}
		}
	}
	
	if (global.cutscene_current != -1){
		return;
	}
	
	// Movement
	if (!obj_player.in_minecart){
		if (image_index < sprite_get_number(sprite_index)){
			image_index += sprite_get_speed(sprite_index);
		}else{
			image_index = 0;
		}
		
		if (minecart_speed > 0){
			minecart_speed -= 0.005;
		}else if (minecart_speed < 0){
			minecart_speed += 0.005;
		}
		
		var cartx = x - 10;
		var carty = y - 2;
		var cartw = 20;
		var carth = 35;
		
		var xvel = lengthdir_x(minecart_speed, minecart_dir);
		var yvel = lengthdir_y(minecart_speed, minecart_dir);
		
		var xveloff = xvel + sign(xvel);
		var yveloff = yvel + sign(yvel);
		
		if (yvel != 0 && xvel == 0){
			cartx = x - 4;
			cartw = 8;
		}
		
		if (xvel != 0 && yvel == 0){
			carty = y + 15;
			carth = 8;
		}
		
		if (minecart_break > 0){
			minecart_break --;
			minecart_touching = false;
		}else{
			if (collision_rectangle(cartx + xveloff, carty + yveloff, cartx + cartw + xveloff, carty + carth + yveloff, obj_block_direction, false, true)){
				if (!minecart_touching){
					minecart_dir -= 90 * sign(minecart_speed);
					minecart_touching = true;
				}
			}else{
				if (minecart_touching){
					minecart_touching = false;
					minecart_break = 2;
				}
			}
		}
		
		var absmdir = abs(minecart_dir);
		minecart_dir_clean = absmdir - ((absmdir div 360) * 360);
		
		if (minecart_dir_clean == 90) || (minecart_dir_clean == 270){
			mysprite = spr_pawn_minecart_1;
		}else{
			mysprite = spr_pawn_minecart_0;
		}
		
		x += xvel;
		y += yvel;
	}
	
	sprite_index = mysprite;
}else{
	minecart_speed = 0;
	image_speed = 0;
	image_index = 0;
}