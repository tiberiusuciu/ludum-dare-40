if (amount_of_snowflakes >= 0) {
	if (!await) {
		with (obj_snow_generator) {
			var xx = irandom_range(x-16, x + 16);
			if (choose(0, 1)) {
				var snow_particle = instance_create_layer(xx, y, "Particles", obj_snow_particle);
				snow_particle.hspd = other.hspd;
				snow_particle.vspd = other.vspd;
				other.amount_of_snowflakes--;
			}
		}
		await = true;
		alarm[0] = 30;
	}
}
else {
	other.amount_of_snowflakes = irandom_range(1, 10);
}
