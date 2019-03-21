// Enemy Total
var listSize = array_length_1d(global.enemy);
var total = 0, player = global.player;

if (instance_exists(player)){
	for(var i = 0; i < listSize; i ++){
	
		if (instance_exists(global.enemy[i])){
			var inst = instance_nearest(player.x, player.y, global.enemy[i]);
		
			if (point_distance(player.x, player.y, inst.x, inst.y)<200){
				total += instance_number(global.enemy[i]);
			}
		}
	}
}

return total;