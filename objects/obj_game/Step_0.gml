if (is_win) {
	exit;
}

if (play_death_transition) {
	exit;
}

if (is_game_over) {
	game_score -= 100;
	room_restart();
	exit;
}

if (room != room0 && room != room1 && room != room2 && room != room5) {
	level_duration--;
}

if (room == room5) {
	level_duration -= 3;
}

// Debug mode!
//var next = keyboard_check_pressed(ord("N"));
//var restart = keyboard_check_pressed(ord("R"));
//var previous = keyboard_check_pressed(ord("P"));


//if (next) {
//	room_goto_next();
//}
//if (previous) {
//	room_goto_previous();
//}
//if (restart) {
//	room_restart();
//}

player_is_loosing_health = false;
if (level_duration/max_level_duration <= .75) {
	with (obj_fire_level_1) {
		if (other.ready_to_spawn_fire_0 && !has_created_fire) {
			instance_create_layer(x, y, "Fire", obj_fire);
			other.ready_to_spawn_fire_0 = false;
			has_created_fire = true;
		}
	}
	if (!ready_to_spawn_fire_0 && !alarm_0_started) {
		if (room != room5) {
			alarm[0] = room_speed * 2;
		}
		else {
			alarm[0] = room_speed;
		}
		alarm_0_started = true;
	}
}

if (level_duration/max_level_duration <= .5) {
	snowman_health--;
	player_is_loosing_health = true;
	if (instance_exists(obj_snowman)) {
		obj_snowman.is_loosing_health = true;
	}
	with (obj_fire_level_2) {
		if (other.ready_to_spawn_fire_1 && !has_created_fire) {
			instance_create_layer(x, y, "Fire", obj_fire);
			other.ready_to_spawn_fire_1 = false;
			has_created_fire = true;
		}
	}
	if (!ready_to_spawn_fire_1 && !alarm_1_started) {
		if (room != room5) {
			alarm[1] = room_speed * 2;
		}
		else {
			alarm[1] = room_speed;
		}
		alarm_1_started = true;
	}
}

if (level_duration/max_level_duration <= .1) {
	snowman_health -= 2;
	player_is_loosing_health = true;
	if (instance_exists(obj_snowman)) {
		obj_snowman.is_loosing_health = true;
	}
	with (obj_fire_level_3) {
		if (other.ready_to_spawn_fire_2 && !has_created_fire) {
			instance_create_layer(x, y, "Fire", obj_fire);
			other.ready_to_spawn_fire_2 = false;
			has_created_fire = true;
		}
	}
	if (!ready_to_spawn_fire_2 && !alarm_2_started) {
		if (room != room5) {
			alarm[2] = room_speed * 2;
		}
		else {
			alarm[2] = room_speed;
		}
		alarm_2_started = true;
	}
}
