visible = true;
sprite_index = spr_pawn_minecart_0;

if (instance_exists(global.player)){
	var pickup_range = 10;
	var pressed = keyboard_check_pressed(ord("E"));
	
	if (global.player.in_minecart){
		if (global.player.minecart == id){
			visible = false;

			if (pressed){
				global.player.minecart = noone;
				global.player.minecart_sprite = noone;
				global.player.minecart_sprite_image = 0;
				global.player.minecart_update_interval = 0;
				global.player.in_minecart = false;
				global.player.sprite_index = spr_player_idle_2;
			}
		}
	}else{
		if (distance_to_object(global.player) < pickup_range){
			sprite_index = spr_pawn_minecart_0_interact;
			scr_ui_control_indicate("Minecart [E]");
		
			if (pressed){
				global.player.minecart = id;
				global.player.in_minecart = true;
				global.player.x = x;
				global.player.y = y;
			}
		}
	}
}