var length = array_length_1d(global.enemy);

for(var o = 0; o < length; o ++){
	var object = global.enemy[o];
	
	if (!object.cutscene_prop) && (!object.in_cutscene){
		with(object){
			instance_destroy();
		}
	}
}