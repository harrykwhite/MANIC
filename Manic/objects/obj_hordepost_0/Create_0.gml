index = -1;

interact = false;
interact_break = 10;

completed = false;
completed_sound_faded = false;
completed_check = 0;

part_time_max = 10;
part_time = part_time_max;

post_sound = noone;

image_speed = 0;

if (random(2) < 1){
	image_index = random(image_number);
}