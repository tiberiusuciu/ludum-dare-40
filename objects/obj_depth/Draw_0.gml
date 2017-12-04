if (ds_exists(ds_depth_grid, ds_type_grid)) {
	var instances_count = instance_number(obj_depth_parent);
	ds_grid_resize(ds_depth_grid, 2, instances_count);
	var yy = 0;
	with (obj_depth_parent) {
		other.ds_depth_grid[# 0, yy] = id;
		other.ds_depth_grid[# 1, yy] = y;
		yy++;
	}
	
	ds_grid_sort(ds_depth_grid, 1, true);
	for (var i = 0; i < instances_count; i++) {
		var instanceID = ds_depth_grid[# 0, i];
		with (instanceID) {
			draw_self();
		}
		with(obj_hand_parents) {
			draw_self();
		}
	}
	ds_grid_clear(ds_depth_grid, 0);
}