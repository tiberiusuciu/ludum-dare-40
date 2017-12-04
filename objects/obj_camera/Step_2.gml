if (instance_exists(obj_snowman)) {
	x = lerp(x, target.x, .1);
	y = lerp(y, target.y - 16, .1);
	
	x = clamp(x, width / 2, room_width - width / 2);
	y = clamp(y, height / 2, room_height - height / 2);
	
	if (room == room5) {
		x += random_range(-1.5, 1.5);
	}
	
	camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);
}