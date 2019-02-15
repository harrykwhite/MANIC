var cart_speed = 2.5;

if (sprite_index != spr_pawn_minecart_0) && (sprite_index != spr_pawn_minecart_1){
	sprite_index = spr_pawn_minecart_0;
}

if (mouse_x > x){
	image_xscale = 1;
}else{
	image_xscale = -1;
}

hspd = 0;
vspd = 0;

if (keyboard_check(ord("D"))){
	if (y >= minecart.rect_y2) || (y <= minecart.rect_y1){
		if (x < minecart.rect_x2){
			hspd = cart_speed;
			sprite_index = spr_pawn_minecart_0;
		}
	}
}

if (keyboard_check(ord("A"))){
	if (y >= minecart.rect_y2) || (y <= minecart.rect_y1){
		if (x > minecart.rect_x1){
			hspd = -cart_speed;
			sprite_index = spr_pawn_minecart_0;
		}
	}
}

if (keyboard_check(ord("W"))){
	if (x >= minecart.rect_x2) || (x <= minecart.rect_x1){
		if (y > minecart.rect_y1){
			vspd = -cart_speed;
			sprite_index = spr_pawn_minecart_1;
		}
	}
}

if (keyboard_check(ord("S"))){
	if (x >= minecart.rect_x2) || (x <= minecart.rect_x1){
		if (y < minecart.rect_y2){
			vspd = cart_speed;
			sprite_index = spr_pawn_minecart_1;
		}
	}
}

if (hspd != 0) || (vspd != 0){
	image_speed = 1;
}else{
	image_speed = 0;
}

x += hspd;
y += vspd;