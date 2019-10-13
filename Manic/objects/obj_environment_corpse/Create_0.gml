start = true;
depth_offset = 0;
depth_fall = 0;
parent = -1;

image_xscale = choose(1, -1);
image_speed = 0;
image_index = random(image_number);
image_alpha = 0.8;

repeat(random_range(1, 2)){
    instance_create(x, y, obj_ef_fly);
}