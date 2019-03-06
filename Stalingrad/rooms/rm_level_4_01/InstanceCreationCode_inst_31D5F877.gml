index = 46;
reactivate_on_death = true;
deactivate_on_activate = true;
destroy_on_activate = false;
special = "levelfourbossrestart";
if (global.game_boss_thedogkeeper_killed){
	instance_destroy();
}