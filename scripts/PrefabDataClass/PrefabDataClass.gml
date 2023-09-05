function PrefabDataClass(_instance) constructor {
	pos_x = _instance.x;
	pos_y = _instance.y;
	angle = _instance.image_angle;
	color = _instance.image_blend;
	xscale = _instance.image_xscale;
	yscale = _instance.image_yscale;
	img_speed = _instance.image_speed;
	img_frame = _instance.image_index;
	obj_index = _instance.object_index;

	variables = {};
	
	var _names = variable_instance_get_names(_instance);
	for(var i = 0; i < array_length(_names); i++){
		if(string_pos(PREFAB_INSTANCE_VARIABLES_SNAPSHOT_PREFIX, _names[i]) > 0){
			variable_struct_set(variables, _names[i], variable_instance_get(_instance, _names[i]));	
		}
	}
}