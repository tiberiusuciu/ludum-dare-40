if (score_given) {
	if (is_on_snow) {
	spd = 2;
	}
	else {
		spd = 1;
	}
	is_walking = false;
	if (dst_to_walk > 0) {
	
		is_walking = true;
	
		if (!is_on_snow && (hspd != 0 || vspd != 0)) {
			duration--;
		}
	
		image_xscale = sign(hspd);
	
		// Horizontal Collisions
		if (place_meeting(x + hspd, y, obj_collision)) {
			while (!place_meeting(x + sign(hspd), y, obj_collision)) {
				x += sign(hspd);
			}
			hspd = 0;
			dst_to_walk = 0;
		}

		// Vertical Collisions
		if (place_meeting(x, y + vspd, obj_collision)) {
			while (!place_meeting(x, y + sign(vspd), obj_collision)) {
				y += sign(vspd);
			}
			vspd = 0;
			dst_to_walk = 0;
		}
	
		x += hspd * spd;
		y += vspd * spd;
	
		dst_to_walk -= power(hspd, 2) + power(vspd, 2);
	}
	else if (!alarm_initialized) {
		alarm[0] = room_speed * irandom_range(2, 6);
		alarm_initialized = true;
	}
	is_on_snow = false;

	// Animations
	if (is_walking) {
		image_speed = .5;	
	}
	else {
		image_speed = 0;
	}
}

with (obj_hand_parents) {
	if (abs(x - other.x) <= 32*1.5 && abs(y - other.y) <= 32*1.5 && is_on_fire) {
		other.duration--;
	}
}

with (obj_fire) {
	if (abs(x - other.x) <= 32*1.5 && abs(y - other.y) <= 32*1.5) {
		other.duration--;
	}
}

if (duration <= 0) {
	instance_destroy();
}