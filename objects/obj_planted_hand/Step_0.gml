event_inherited();

with(obj_fire) {
	if (abs(other.x - x) <= 32 && abs(other.y - y) <= 32) {
		other.is_on_fire = true;
	}
}

with(obj_hand_parents) {
	if (abs(other.x - x) <= 32 && abs(other.y - y) <= 32 && is_on_fire) {
		other.is_on_fire = true;
	}
}


if (is_on_fire) {
	sprite_index = spr_planted_hand_burning;
	image_speed = .5;
	radius.visible = true;
}
else {
	sprite_index = spr_planted_hand;
	image_speed = 0;
	image_index = 0;
}