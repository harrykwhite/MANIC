death = false;

hit = 10;
hit_time = 0;

basex = x;
basey = y;

spd = 0;
dir = 0;

flash = 0;

basey = y;

var scale = random_range(0.95, 1.1);

image_xscale = scale;
image_yscale = scale;
image_speed = 0;

if (random(2) < 1){
	image_index = random(image_number);
}