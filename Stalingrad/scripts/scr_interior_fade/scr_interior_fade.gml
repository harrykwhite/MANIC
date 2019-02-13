var alpha = argument0;

if (fadeOwner == noone){
	fadeOwner = instance_place(x, y, obj_interior_fade);
}

if (fadeOwner != noone){
	if (fadeOwner.fade){
		if (alpha > 0){
			alpha -= 0.05;
		}
	
	}else{
		if (alpha < 1){
			alpha += 0.05;
		}
	
	}
}

return alpha;