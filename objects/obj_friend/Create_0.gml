hspd = 0;
vspd = 0;
spd = 3;
dst_to_walk = 0;
alarm[0] = irandom_range(2, 6);
alarm_initialized = true;
is_on_snow = false;
score_given = false;
duration = room_speed * 10;
is_walking = false;

sprite_catalog[0] = spr_snow_friend_0;
sprite_catalog[1] = spr_snow_friend_1;
sprite_catalog[2] = spr_snow_friend_2;
sprite_catalog[3] = spr_snow_friend_3;
sprite_catalog[4] = spr_snow_friend_4;
sprite_catalog[5] = spr_snow_friend_5;
sprite_catalog[6] = spr_snow_friend_6;
sprite_catalog[7] = spr_snow_friend_7;
sprite_catalog[8] = spr_snow_friend_8;
sprite_catalog[9] = spr_snow_friend_9;

sprite_index = sprite_catalog[irandom_range(0, 9)];

image_speed = 0;
