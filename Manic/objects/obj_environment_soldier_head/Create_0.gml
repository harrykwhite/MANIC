start = true;
parent = -1;
depth_offset = 0;
image_xscale = choose(1, -1);
image_angle = image_angle + random_range(-6, 6);
image_speed = 0;
image_index = random(image_number);
depth = layer_get_depth("Main") + 1;