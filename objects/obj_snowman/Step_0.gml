if (obj_game.play_death_transition) {
	image_index = 7;
	exit;
}

if (play_death_sequence && !started_death_sequence) {
	//Build Suspense
	alarm[0] = room_speed;
	image_speed = 0;
	
	started_death_sequence = true;
	exit;
}
if (started_death_sequence) {
	exit;
}

if (is_on_snow) {
	spd = 3;
}
else {
	spd = 2;
}

is_loosing_health = false;
has_walked = false;
var right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var up = keyboard_check(ord("W")) || keyboard_check(vk_up);
var left = keyboard_check(ord("A")) || keyboard_check(vk_left);
var down = keyboard_check(ord("S")) || keyboard_check(vk_down);
pickup = keyboard_check_pressed(ord("E")) || mouse_check_button_pressed(mb_left);
var drop = keyboard_check_pressed(ord("Q")) || mouse_check_button_pressed(mb_right);


// TO CONSIDER: Remove diagonal movement?
hspd = (right - left) * spd;
vspd = (down - up) * spd;

// Loosing life when not on snow
if (!is_on_snow) {
	if (hspd != 0 || vspd != 0) {
		is_loosing_health = true;
		obj_game.snowman_health--;
	}
}

// Animations
if (hspd != 0 || vspd != 0) {
	sprite_index = spr_snowman;
	image_speed = .5;
	has_walked = true;
	if (sign(hspd) == -1) {
		image_xscale = -1;
	}
	else if (sign(hspd) == 1) {
		image_xscale = 1;
	}
}
else {
	sprite_index = spr_snowman;
	image_speed = 0;
	//image_index = 0;
}


// Horizontal Collisions
if (place_meeting(x + hspd, y, obj_collision)) {
	while (!place_meeting(x + sign(hspd), y, obj_collision)) {
		x += sign(hspd);
	}
	hspd = 0;
}

// Vertical Collisions
if (place_meeting(x, y + vspd, obj_collision)) {
	while (!place_meeting(x, y + sign(vspd), obj_collision)) {
		y += sign(vspd);
	}
	vspd = 0;
}

x += hspd;
y += vspd;

is_on_snow = false;

// Manage health lost
with (obj_hand_parents) {
	if (is_on_fire && instance_exists(obj_game) && abs (x - other.x) <= 32 && abs(y - other.y) <= 32) {
		obj_game.snowman_health--;
		other.is_loosing_health = true;
	}
}

with (obj_fire) {
	if (abs(x - other.x) <= 32 && abs(y - other.y) <= 32) {
		obj_game.snowman_health--;
		other.is_loosing_health = true;
	}
}

// Check for is dead
if (instance_exists(obj_game)) {
	if (obj_game.snowman_health <= 0) {
		obj_game.is_game_over = true;
		audio_play_sound(snd_death, 6, false);
	}
}

// Check for dropping sticks
if (drop) {
	if (instance_exists(obj_right_hand) && !obj_game.is_right_hand_gone) {
		// Generate object stick on terrain
		var planted_hand = instance_create_layer(x, y, "Hands", obj_planted_hand);
		if (obj_right_hand.is_on_fire) {
			planted_hand.is_on_fire = true;
			planted_hand.duration = obj_right_hand.duration;
		}
		
		// Destroy hand
		with (obj_right_hand) {
			audio_play_sound(snd_drop, 6, false);
			instance_destroy();
		}
	}
	else if (instance_exists(obj_left_hand) && !obj_game.is_left_hand_gone) {
		// Generate object stick on terrain
		var planted_hand = instance_create_layer(x, y, "Hands", obj_planted_hand);
		if (obj_left_hand.is_on_fire) {
			planted_hand.is_on_fire = true;
			planted_hand.duration = obj_left_hand.duration;
		}
		
		// Destroy hand
		with (obj_left_hand) {
			audio_play_sound(snd_drop, 6, false);
			instance_destroy();
		}
	}
}

// Check for dropping sticks
if (pickup) {
	with (obj_planted_hand) {
		if (!instance_exists(obj_right_hand) && obj_game.is_right_hand_gone && abs(x - other.x) <= 32 && abs(y - other.y) <= 32) {
			// Generate object stick on terrain
			var right_hand = instance_create_layer(x, y, "Hands", obj_right_hand);
			if (is_on_fire) {
				right_hand.is_on_fire = true;
				right_hand.duration = duration;
			}
			audio_play_sound(snd_pickup, 6, false);
			instance_destroy();
			obj_game.is_right_hand_gone = false; 
		}
		else if (!instance_exists(obj_left_hand) && obj_game.is_left_hand_gone && abs(x - other.x) <= 32 && abs(y - other.y) <= 32) {
			// Generate object stick on terrain
			var left_hand = instance_create_layer(x, y, "Hands", obj_left_hand);
			if (is_on_fire) {
				left_hand.is_on_fire = true;
				left_hand.duration = duration;
			}
		
			// Destroy hand
			audio_play_sound(snd_pickup, 6, false);
			instance_destroy();
		
			obj_game.is_left_hand_gone = false; 
		}
	}
}

// Hurt animation overwrite
if (is_loosing_health || obj_game.player_is_loosing_health) {
	if (has_walked) {
		sprite_index = spr_snowman_walk_sweat;
	}
	else {
		sprite_index = spr_snowman_idle_sweat;
	}
	image_speed = .5;
}

if (is_ready_to_play_sound && (prev_x != x || prev_y != y)) {
	audio_sound_pitch(snd_walk, random_range(.5, 1.5));
	audio_play_sound(snd_walk, 5, false);
	is_ready_to_play_sound = false;
	alarm[1] = room_speed * .25;
}

prev_x = x;
prev_y = y;

with (obj_friend) {
	if (abs(x - other.x) <= 16 && abs(y - other.y) <= 16 && !score_given) {
		obj_game.game_score += 100;
		score_given = true;
		audio_sound_pitch(snd_snowman_friend, random_range(.8, 1.2));
		audio_play_sound(snd_snowman_friend, 5, false);
	}
}