// Teleport to player
if (cutscene_break_time <= 0) && (!global.game_pause) && (global.cutscene_current == -1){
	if (room == rm_level_10_01){
		if (finalboss_ymin_meeting){
			return;
		}
	}
	
	if (!onscreen(x, y + 4, -40)){
		var counter = 0, doteleport = true;
		
		var px = clamp(obj_player.x, 24, room_width - 24);
		var py = clamp(obj_player.y, 24, room_height - 24);
		
		do{
			var xtp = px + random_range(-150, 150);
			var ytp = py + random_range(-150, 150);
			
			if (counter < 200){
				counter ++;
			}else{
				doteleport = false;
				break;
			}
		}until (inroom(xtp, ytp)) && (!collision_rectangle(xtp - 20, ytp - 30, xtp + 20, ytp + 30, obj_p_solid, false, true) && (!collision_line(xtp, ytp, px, py, obj_p_solid, false, true)));
		
		if (doteleport){
			x = xtp;
			y = ytp;
			
			repeat(9){
				part_particles_create(global.ps_front, x + random_range(-7, 7), y + random_range(-7, 7), global.pt_spawn_0, 1);
			}
		}
	}
}