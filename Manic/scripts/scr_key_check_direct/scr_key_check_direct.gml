///@param key
var key = argument0;

if (macbuild){
	return keyboard_check(key);
}else{
	return keyboard_check_direct(key);
}