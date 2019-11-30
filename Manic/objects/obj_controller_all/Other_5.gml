part_system_clear(global.ps_front);
part_system_clear(global.ps_bottom);

part = 0;

global.boss_current = -1;

if (room_pers_runthrough_turnoff){
	global.pers_runthrough = false;
	room_pers_runthrough_turnoff = false;
}