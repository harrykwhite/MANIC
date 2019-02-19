visible = true;
sprite_index = spr_pawn_minecart_0;

if (instance_exists(global.player)){
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
					global.player.minecart_update_interval = 0;
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
				sprite_index = spr_pawn_minecart_0_interact;
				scr_ui_control_indicate("Minecart [E]");
		
				if (instance_exists(gun)){
					gun.interact = true;
				}
			
				if (pressed){
					global.player.minecart = id;
					global.player.in_minecart = true;
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