function __prefab_data_generate_struct(_prefab_data_class){
	var _struct;
	
	with(_prefab_data_class){
		_struct = {
			image_angle : angle,
			image_blend : color, 
			image_speed : img_speed,
			image_index : img_frame,
			image_xscale : xscale, 
			image_yscale : yscale,
		}
		
		var _names = variable_struct_get_names(variables);
		for(var i = 0; i < array_length(_names); i++){
			variable_struct_set(_struct, _names[i], variables[$ _names[i]]);
		}
	}
	
	return _struct;
}