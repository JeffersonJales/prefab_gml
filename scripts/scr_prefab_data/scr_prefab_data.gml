
global.__prefabs_data = {};			


function prefab_data_add(layer_name, destroy_instances = true){
	if(global.__prefabs_data != undefined && !PREFAB_DATA_OVERWRITE_ENABLE) return;
	
	var _insts = layer_get_all_elements(layer_name);
	for (var i = 0; i < array_length(_insts); ++i) {
		_insts[i] = layer_instance_get_instance(_insts[i]);
	}
	
	var _len = array_length(_insts);
	var _arr = array_create(_len);

	array_sort(_insts, function(el1, el2){
		return sign(el2.depth_priority - el1.depth_priority)
	})
	
	for(var i = 0; i < _len; i++){
		_arr[i] = new __prefab_data_class(_insts[i]);
	}
	
	if(destroy_instances){
		for (var i = 0; i < _len; ++i) {
		  instance_destroy(_insts[i]);
		}
	}
	
	global.__prefabs_data[$ layer_name] = _arr;
	return _arr;
}

function prefab_data_add_auto(destroy_instances = true){
	var _layers = layer_get_all();
	for(var i = 0; i < array_length(_layers); i++){
		var _name = layer_get_name(_layers[i]);
		if(string_pos(PREFAB_LAYER_NAME_PREFIX, _name) > 0){
			prefab_data_add(_name, destroy_instances);
		}
	}	
}

function prefab_data_remove(prefab){
	var _data = global.__prefabs_data[$ prefab];
	if(_data != undefined) variable_struct_remove(global.__prefabs_data, prefab);
}

function prefab_data_exists(prefab){ 
	return global.__prefabs_data[$ prefab] != undefined;		
}

function prefab_data_get(prefab){
	return global.__prefabs_data[$ prefab];
}
