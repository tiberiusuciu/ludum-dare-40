event_inherited();

if (previous_duration != duration) {
	if(is_ready_to_play_sound) {
		audio_sound_pitch(snd_constant_burning, random_range(.8, 1.2));
		audio_play_sound(snd_constant_burning, 4, false);
		is_ready_to_play_sound = false;
		alarm[0] = room_speed * .75;
	}
}

previous_duration = duration;