// Teleport to player
if (cutscene_break_time <= 0) && (!global.game_pause) && (global.cutscene_current == -1){
	if (!onscreen(x, y + 4, 5)){
		var counter = 0, doteleport = true;
		
		do{
			var xtp = obj_player.x + random_range(-200, 200);
			var ytp = obj_player.y + random_range(-200, 200);
			
			if (counter < 200){
				counter ++;
			}else{
				doteleport = false;
				break;
			}
		}until (!place_meeting(xtp, ytp, obj_p_solid) && !collision_line(xtp, ytp, obj_player.x, obj_player.y, obj_p_solid, false, true));
		
		if (doteleport){
			x = xtp;
			y = ytp;
			
			light_brightness = 0;
			
			repeat(9){
				part_particles_create(global.ps_front, x + random_range(-7, 7), y + random_range(-7, 7), global.pt_spawn_0, 1);
			}
		}
	}
}