// Enemy Total
var listSize = array_length_1d(global.enemy);
var total = 0;

if (instance_exists(global.player)){
	for(var i = 0; i < listSize; i++){
	
		if (instance_exists(global.enemy[i])){
			var inst = instance_nearest(global.player.x, global.player.y, global.enemy[i]);
		
			if (point_distance(global.player.x, global.player.y, inst.x, inst.y)<200){
				total += instance_number(global.enemy[i]);
			}
		}
	}
}

return total;