started_death_sequence = true;
sprite_index = spr_melting;
image_speed = .25;
audio_play_sound(snd_dead_4_good, .8, false);
with (obj_left_hand) {
	instance_destroy();
}
with (obj_right_hand) {
	instance_destroy();
}