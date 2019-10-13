var swidth = sprite_get_width(sprite_index);
var sheight = sprite_get_height(sprite_index);

var xcount = image_xscale;
var ycount = image_yscale;

draw_set_alpha(image_alpha);

for(var yy = 0; yy < ycount; yy ++){
	for(var xx = 0; xx < xcount; xx ++){
		draw_sprite(sprite_index, image_index, x + (xx * swidth), y + (yy * sheight));
	}
}

draw_set_alpha(1);