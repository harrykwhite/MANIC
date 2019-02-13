x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);
spd *= 0.9;
image_angle += spd * 2;

if (spd < 0.1){
	spd = 0;
}