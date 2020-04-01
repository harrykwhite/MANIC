var colrange = 20;

if (collision_rectangle(x - colrange, y - colrange, x + colrange, y + colrange, obj_weapondrop, false, true)){
	return;
}

var drop = instance_create(x, y, obj_weapondrop);
drop.index = index;
drop.pack = pack;
drop.quantity = quantity;
drop.angle = random_range(-30, 30);
drop.alpha = 0;

index = -1;
pack = false;
quantity = -1;