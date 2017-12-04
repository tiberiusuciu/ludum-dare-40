if (is_on_fire) {
	duration--;
	if (instance_exists(radius)) {
		radius.visible = true;
	}
}

if (duration <= 0) {
	instance_destroy();
}