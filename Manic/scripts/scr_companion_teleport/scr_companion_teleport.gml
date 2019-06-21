// Teleport to player
if (!onscreen(x, y, 15)){
	var xtp = obj_player.x + random_range(-70, 70);
	var ytp = obj_player.y + random_range(-70, 70);
	var counter = 0;
	var doteleport = true;
	
	while(place_meeting(xtp, ytp, obj_p_solid)){
		xtp = obj_player.x + random_range(-70, 70);
		ytp = obj_player.y + random_range(-70, 70);
	
		if (counter < 100){
			counter ++;
		}else{
			doteleport = false;
			break;
		}
	}
	
	if (doteleport){
		x = xtp;
		y = ytp;
	}
}