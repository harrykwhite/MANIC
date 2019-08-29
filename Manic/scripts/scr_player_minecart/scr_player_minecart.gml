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

if (scr_input_get_mouse_x() > x){
	image_xscale = 1;
}else{
	image_xscale = -1;
}

var absmdir = abs(minecart_dir);
var mdir = absmdir - ((absmdir div 360) * 360);
var acceleration = 0.025;

absmdir = abs(minecart_dir);
mdir = absmdir - ((absmdir div 360) * 360);

if (mdir == 90) || (mdir == 270){
	minecart_sprite = spr_pawn_minecart_1;
}else{
	minecart_sprite = spr_pawn_minecart_0;
}

if (scr_input_is_down(InputBinding.Right)){
	if (mdir == 180) || (mdir == 270){
		if (minecart_speed > -4){
			minecart_speed -= acceleration;
		}
	}else{
		if (minecart_speed < 4){
			minecart_speed += acceleration;
		}
	}
}else if (scr_input_is_down(InputBinding.Left)){
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

var cartx = x - 10;
var carty = y - 2;
var cartw = 20;
var carth = 35;

var xvel = lengthdir_x(minecart_speed, minecart_dir);
var yvel = lengthdir_y(minecart_speed, minecart_dir);

var xveloff = xvel + sign(xvel);
var yveloff = yvel + sign(yvel);

if (yvel != 0 && xvel == 0){
	cartx = x - 4;
	cartw = 8;
}

if (xvel != 0 && yvel == 0){
	carty = y + 15;
	carth = 8;
}

if (minecart_break > 0){
	minecart_break --;
	minecart_touching = false;
}else{
	if (collision_rectangle(cartx + xveloff, carty + yveloff, cartx + cartw + xveloff, carty + carth + yveloff, obj_block_direction, false, true)){
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

x += xvel;
y += yvel;

minecart.x = x;
minecart.y = y;
minecart.minecart_speed = minecart_speed;
minecart.minecart_dir = minecart_dir;
minecart.image_index = minecart_sprite_image;
minecart.sprite_index = minecart_sprite;