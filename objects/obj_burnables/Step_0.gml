with (obj_hand_parents) {
	if (is_on_fire && abs (x - other.x) <= 32 * 1.5 && abs(y - other.y) <= 32 * 1.5) {
		other.duration--;
	}
}

with (obj_fire) {
	if (abs (x - other.x) <= 32 && abs(y - other.y) <= 32) {
		other.duration--;
	}
}

if (duration <= 0) {
	audio_play_sound(snd_burning, 6, false);
	instance_destroy();
}