if (fadeOwner == noone){
	fadeOwner = instance_place(x + sprite_width / 2, y + sprite_height / 2, obj_interior_fade);
}

if (fadeOwner != noone){
	if (fadeOwner.fade){
		if (image_alpha > 0){
			image_alpha -= 0.05;
		}
	}else{
		if (image_alpha < 1){
			image_alpha += 0.05;
		}
	}
}