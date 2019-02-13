var enemy_max = 0;

if (place_meeting(x + 1, y + 1, global.player)){
	
	if (scr_enemy_total() <= enemy_max){
		instance_destroy();
		global.player_respawn_x = global.player.x;
		global.player_respawn_y = global.player.y;
	}
}