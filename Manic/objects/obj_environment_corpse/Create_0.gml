start = true;
depth_offset = 0;
depth_fall = 0;
parent = -1;

sprite_index = choose(spr_environment_corpse, spr_environment_corpse_woman);
image_xscale = choose(1, -1);
image_speed = 0;
image_index = random(image_number);

var counter = 0;
repeat(random_range(1, 2)){
    fly[counter] = instance_create(x, y, obj_ef_fly);
	fly[counter].xbase = x;
	fly[counter].ybase = y;
	counter ++;
}