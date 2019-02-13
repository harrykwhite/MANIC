image_index = random(image_number);
image_speed = 0;
image_alpha = 0;
depth = 1;

dir = choose(360, 180);
rspd = 0;
spd = 0.6 + random_range(-0.3, 0.3);
acc = 0.01;
time = random_range(70, 150);
life = random_range(60 * 4, 60 * 8);