image_alpha = 0;
depth = layer_get_depth("Main") + 1;

dir = choose(-1, 1);
rspd = 0;
spd = 0.6 + random_range(-0.3, 0.3);
acc = 0.01;
time = random_range(70, 150);
life = random_range(60 * 6, 60 * 8);