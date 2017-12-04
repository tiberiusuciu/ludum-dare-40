is_on_fire = false;
duration = room_speed * 10;
radius = instance_create_layer(x, y, "Radius", obj_radius);
radius.target = self;
radius.visible = false;