function prefab_data_add_auto(_destroy_instances = true){
	var _layers = layer_get_all();
	for(var i = 0; i < array_length(_layers); i++){
		var _name = layer_get_name(_layers[i]);
		if(string_pos(PREFAB_INSTANCE_LAYER_NAME_PREFIX, _name) > 0){
			prefab_data_add(_name, _destroy_instances);
		}
	}	
}