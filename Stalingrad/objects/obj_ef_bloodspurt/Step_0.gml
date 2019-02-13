x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);
y += grav;
spd *= 0.9;

if (life > 0){
	life--;
}else{
	instance_destroy();
}