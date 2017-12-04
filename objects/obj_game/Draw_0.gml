draw_set_alpha(1);
if (is_win) {

	exit;
}



draw_set_alpha(.5);

// TODO: Tone down the reds?
var ratio = clamp((level_duration/max_level_duration), 0, 1);
var color = merge_color(c_red, c_navy, ratio);

draw_rectangle_color(0, 0, room_width, room_height, color, color, color, color, false);

if (play_death_transition) {
	
	current_alpha = clamp(current_alpha, 0, 1);
	
	if (current_alpha >= 1) {
		play_death_transition = false;
		is_win = true;
		room_goto(room6);
	}
	
	color = c_black;
	draw_set_alpha(current_alpha);
	draw_rectangle_color(0, 0, room_width, room_height, color, color, color, color, false);
	current_alpha+= .01;
}

draw_set_alpha(1);