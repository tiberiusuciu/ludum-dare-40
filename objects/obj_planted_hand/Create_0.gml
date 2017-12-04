event_inherited();

sprite_index = spr_planted_hand;
image_speed = 0;
image_index = 0;

radius = instance_create_layer(x, y, "Radius", obj_radius);
radius.target = self;
radius.visible = false;