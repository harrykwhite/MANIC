// Enemy Total
var listSize = array_length_1d(global.enemy);

for(var i = 0; i < listSize; i++){

	if (instance_exists(global.enemy[i])){
		var number = instance_number(global.enemy[i]);
	
		for(var num = 0; num < number; num++){
			var inst = instance_find(global.enemy[i], num);
			inst.x = inst.xstart;
			inst.y = inst.ystart;
			inst.health_current = inst.health_max;
		}
	}
}