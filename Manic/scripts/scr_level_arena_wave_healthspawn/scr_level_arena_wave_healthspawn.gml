var hinst;
var hnum = instance_number(obj_block_arena_health);

for(var h = 0; h < hnum; h ++){
	hinst = instance_find(obj_block_arena_health, h);
	
	with(hinst){
		event_user(0);
	}
}