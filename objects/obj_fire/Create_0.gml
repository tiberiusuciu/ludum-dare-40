sprite_index = choose(spr_fire_0, spr_fire_1, spr_fire_2);
image_speed = random_range(.8, 1.2);
target_layer = "Radius";
if (layer_get_name(layer) == "ForegroundFire") {
	target_layer = "ForegroundRadius";
}
var radius = instance_create_layer(x, y, target_layer, obj_radius);
radius.target = self;