dir = point_direction(x, y, mouse_x, mouse_y);

if (instance_exists(obj_snowman)) {
	// Position hands accordingly to snowman facing direction
	if (obj_snowman.image_xscale == 1) {
		x = obj_snowman.x + 7;
		y = obj_snowman.y - 9;
		image_angle = dir;
		image_yscale = 1;
	}
	else {
		x = obj_snowman.x - 7;
		y = obj_snowman.y - 9;
		image_angle = dir + 90;
		image_yscale = -1;
	}
}

if (is_on_fire) {
	image_speed = .5;
	sprite_index = spr_hand_burning;
}
else {
	image_speed = 0;
	sprite_index = spr_hand;
	image_index = 0;
}