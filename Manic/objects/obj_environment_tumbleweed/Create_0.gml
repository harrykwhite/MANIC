image_alpha = 0;
depth = layer_get_depth("Main") + 1;

dir = choose(-1, 1);
spd = 1.3 + random_range(-0.3, 0.3);
life = random_range(60 * 3, 60 * 4);