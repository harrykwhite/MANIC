///@param x1
///@param y1
///@param x2
///@param y2
///@param width
///@param list
///@param object
///@param notme
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var width = argument4;
var list = argument5;
var obj = argument6;
var notme = argument7;

var dir = point_direction(x1, y1, x2, y2);
var num = 0, onum = 0;
var templist = ds_list_create();

if (width != 1){
	for(var off = 0; off < width; off ++){
	
		num += collision_line_list(x1 + lengthdir_x(off, dir + 90), y1 + lengthdir_y(off, dir + 90), x2 + lengthdir_x(off, dir + 90), y2 + lengthdir_y(off, dir + 90), obj, false, true, templist, true);
	
		for(var i = onum; i < num; i ++){
			list[| i] = templist[| i - onum];
		}
	
		onum = num;
		ds_list_clear(templist);
	}

	for(var off = -1; off > -width; off--){
	
		num += collision_line_list(x1 + lengthdir_x(off, dir + 90), y1 + lengthdir_y(off, dir + 90), x2 + lengthdir_x(off, dir + 90), y2 + lengthdir_y(off, dir + 90), obj, false, true, templist, true);
	
		for(var i = onum; i < num; i ++){
			list[| i] = templist[| i - onum];
		}
	
		onum = num;
		ds_list_clear(templist);
	}
}else{
	num = collision_line_list(x1, y1, x2, y2, obj, false, true, templist, true);
	list[| 0] = templist[| 0];
	ds_list_clear(templist);
}

ds_list_destroy(templist);
return num;