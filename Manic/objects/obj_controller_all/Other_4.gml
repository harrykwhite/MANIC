var iskeyboard = (global.game_input_type == InputType.Keyboard);

warning_prompt = false;
warning_prompt_text = "";
warning_prompt_type = 0;
warning_prompt_alpha = 0;
warning_prompt_selected = iskeyboard ? -1 : 0;
warning_prompt_selected_previous = warning_prompt_selected;
warning_prompt_selected_break = 0;
warning_prompt_scale[0] = 1;
warning_prompt_scale[1] = 1;

unlock_check = false;