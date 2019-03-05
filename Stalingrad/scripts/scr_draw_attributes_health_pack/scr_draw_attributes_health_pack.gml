gpu_set_fog(true, c_white, 0, 0);
draw_set_alpha(glow_alpha * 0.15);
draw_sprite(sprite_index, image_index, x, y);
gpu_set_fog(false, c_black, 0, 0);
draw_set_alpha(1);

if (glow){
	if (glow_alpha < 1){
		glow_alpha += 0.05;
	}
}else{
	if (glow_alpha > 0){
		glow_alpha -= 0.05;
	}
}