sprite_index = spr_player_idle_2_top;
if (minecart_sprite != spr_pawn_minecart_0) && (minecart_sprite != spr_pawn_minecart_1){
	minecart_sprite = spr_pawn_minecart_0;
}

if (minecart_sprite_image < sprite_get_number(minecart_sprite)){
	minecart_sprite_image += sprite_get_speed(minecart_sprite);
}else{
	minecart_sprite_image = 0;
}

if (!instance_exists(minecart)){
	return;
}

if (mouse_x > x){
	image_xscale = 1;
}else{
	image_xscale = -1;
}

var absmdir = abs(minecart_dir);
var mdir = absmdir - ((absmdir div 360) * 360);
var acceleration = 0.025;

var cartx = x - 2;
var carty = y + 16;
var cartw = 4;
var carth = 4;

if (minecart_break > 0){
	minecart_break --;
	minecart_touching = false;
}else{
	if (collision_rectangle(cartx, carty, cartx + cartw, carty + carth, obj_block_direction, false, true)){
		if (!minecart_touching){
			minecart_dir -= 90 * sign(minecart_speed);
			minecart_touching = true;
		}
	}else{
		if (minecart_touching){
			minecart_touching = false;
			minecart_break = 2;
		}
	}
}

absmdir = abs(minecart_dir);
mdir = absmdir - ((absmdir div 360) * 360);

if (mdir == 90) || (mdir == 270){
	minecart_sprite = spr_pawn_minecart_1;
}else{
	minecart_sprite = spr_pawn_minecart_0;
}

if (keyboard_check(ord("D"))){
	if (mdir == 180) || (mdir == 270){
		if (minecart_speed > -4){
			minecart_speed -= acceleration;
		}
	}else{
		if (minecart_speed < 4){
			minecart_speed += acceleration;
		}
	}
}else if (keyboard_check(ord("A"))){
	if (mdir == 180) || (mdir == 270){
		if (minecart_speed < 4){
			minecart_speed += acceleration;
		}
	}else{
		if (minecart_speed > -4){
			minecart_speed -= acceleration;
		}
	}
}else{
	if (minecart_speed > 0){
		minecart_speed -= 0.005;
	}else if (minecart_speed < 0){
		minecart_speed += 0.005;
	}
}

if (minecart_speed != 0) || (minecart_speed != 0){
	image_speed = 1;
}else{
	image_speed = 0;
}

x += lengthdir_x(minecart_speed, minecart_dir);
y += lengthdir_y(minecart_speed, minecart_dir);

minecart.x = x;
minecart.y = y;
minecart.minecart_speed = minecart_speed;
minecart.minecart_dir = minecart_dir;
minecart.image_index = minecart_sprite_image;
minecart.sprite_index = minecart_sprite;