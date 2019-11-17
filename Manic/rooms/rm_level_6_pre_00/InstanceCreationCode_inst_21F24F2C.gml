cutscene_prop = true;
in_cutscene = false;

if (global.game_boss_firstantag_killed) || (!global.game_is_playthrough){
	instance_destroy();
}