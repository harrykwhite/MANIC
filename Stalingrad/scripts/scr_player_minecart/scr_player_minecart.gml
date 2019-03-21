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
	exit;
}

if (mouse_x > x){
	image_xscale = 1;
}else{
	image_xscale = -1;
}

if (keyboard_check(ord("D"))){
	if (minecart_speed < 4){
		minecart_speed += 0.01;
	}
}else if (keyboard_check(ord("A"))){
	if (minecart_speed > -4){
		minecart_speed -= 0.01;
	}
}else{
	if (minecart_speed > 0){
		minecart_speed -= 0.005;
	}
	
	if (minecart_speed < 0){
		minecart_speed += 0.005;
	}
}

if (minecart_bounce_break > 0){
	minecart_bounce_break --;
}else{
	var cartx = sprite_get_bbox_left(minecart_sprite);
	var carty = sprite_get_bbox_top(minecart_sprite);
	var cartw = sprite_get_bbox_right(minecart_sprite) - cartx;
	var carth = sprite_get_bbox_bottom(minecart_sprite) - carty;

	var mblocklist = ds_list_create();
	var mblocktotal = collision_rectangle_list(minecart.x - (minecart.sprite_width / 2) + cartx, minecart.y - (minecart.sprite_height/ 2) + carty, minecart.x - (minecart.sprite_width / 2) + cartx + cartw, minecart.y - (minecart.sprite_height/ 2) + carty + carth, obj_block_minecart, false, false, mblocklist, false);
	if (mblocktotal > 0){
		for(var i = 0; i < mblocktotal; i ++){
			var mblock = mblocklist[| i];
			
			if (mblock.image_angle != minecart_dir){
				minecart_dir = mblock.image_angle;
				minecart_bounce_break = 15;
				break;
			}
		}
	}
}

if (minecart_speed != 0) || (minecart_speed != 0){
	image_speed = 1;
}else{
	image_speed = 0;
}

if ((minecart_dir > 90 - 20) && (minecart_dir < 90 + 20)) || ((minecart_dir > 270 - 20) && (minecart_dir < 270 + 20)){
	minecart_sprite = spr_pawn_minecart_1;
}else{
	minecart_sprite = spr_pawn_minecart_0;
}

x += lengthdir_x(abs(minecart_speed), minecart_dir) * sign(minecart_speed);
y += lengthdir_y(abs(minecart_speed), minecart_dir) * sign(minecart_speed);

minecart.x = x;
minecart.y = y;
minecart.minecart_speed = minecart_speed;
minecart.minecart_bounce_break = minecart_bounce_break;
minecart.minecart_dir = minecart_dir;
minecart.image_index = minecart_sprite_image;
minecart.sprite_index = minecart_sprite;