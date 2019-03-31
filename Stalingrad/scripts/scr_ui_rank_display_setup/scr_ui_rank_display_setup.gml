if (!rank_display_draw){
	
	rank_string[0] = "Deaths";
	rank_alpha[0] = 0;
	rank_display[0] = false;
	rank_score[0] = global.game_score_deaths;

	rank_string[1] = "Weapon Variation";
	rank_alpha[1] = 0;
	rank_display[1] = false;
	rank_score[1] = global.game_score_wpnvariation;

	rank_string[2] = "Artifacts";
	rank_alpha[2] = 0;
	rank_display[2] = false;
	rank_score[2] = global.game_score_artifacts;
	
	rank_string[3] = "Bonus Points";
	rank_alpha[3] = 0;
	rank_display[3] = false;
	rank_score[3] = global.game_score_bonus;

	rank_string[4] = "Total Score";
	rank_alpha[4] = 0;
	rank_display[4] = false;
	rank_score[4] = global.game_score;

	rank = Grade.EMinus;
	rank_time = 60;

	rank_end_display = false;
	rank_end_alpha = 0;

	levelname = global.level_name[global.level_current];
}