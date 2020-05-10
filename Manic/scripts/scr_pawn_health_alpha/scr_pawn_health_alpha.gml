if (health_current < health_max){
	if (instance_exists(obj_player)){
		if (health_alpha < 1){
			health_alpha += 0.1;
		}
	}else{
		if (health_alpha > 0){
			health_alpha -= 0.1;
		}
	}
}else{
	if (health_alpha > 0){
		health_alpha -= 0.1;
	}
}