var scale = random_range(0.95, 1.1);
interact = false;
interact_break = 10;
text = "I haven't been given any dialogue yet!";

image_xscale = scale;
image_yscale = scale;
image_speed = 0;

if (random(2) < 1){
	image_index = random(image_number);
}