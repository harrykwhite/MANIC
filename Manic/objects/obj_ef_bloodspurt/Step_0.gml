x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);
y += grav;
spd *= 0.9;

if (life > 0){
	life--;
}else{
	spd *= 0.2;
	
	if (image_alpha > 0){
		image_alpha -= 0.2;
	}else{
		instance_destroy();
	}
}