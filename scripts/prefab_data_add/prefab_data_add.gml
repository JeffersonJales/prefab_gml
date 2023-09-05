function prefab_data_add(_layer_name, _destroy_instances = true){
	
	var _insts = layer_get_all_elements(_layer_name);
	var _len = array_length(_insts);
	var _arr_order = array_create(_len);

	for (var i = 0; i < _len; ++i) {
		_insts[i] = layer_instance_get_instance(_insts[i]);
	}
	
	if(PREFAB_INSTANCE_AUTO_IMPLEMENTS)
		for (var i = 0; i <_len; ++i) {
			__prefab_local_auto_implement(_insts[i]);
		}

	array_sort(_insts, function(el1, el2){
		return sign(el2.__pref_depth_priority - el1.__pref_depth_priority)
	})
	
	for(var i = 0; i < _len; i++){
		_arr_order[i] = new PrefabDataClass(_insts[i]);
	}
	
	if(_destroy_instances){
		for (var i = 0; i < _len; ++i) {
		  instance_destroy(_insts[i]);
		}
	}
	
	global.__prefabs_data[$ _layer_name] = _arr_order;
}