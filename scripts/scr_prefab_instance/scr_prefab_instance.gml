
#macro PREFAB_INSTANCE_WITHOUT_PARENT -100
#macro PREFAB_INSTANCE_FUNCTION_NULL function(){}

global.__prefab_instance_variables = {}			/// Will hold an array with strings (variables names / pointers)

function prefab_instance_implemts(uniqueId = "myId", on_create = PREFAB_INSTANCE_FUNCTION_NULL, on_destroy = PREFAB_INSTANCE_FUNCTION_NULL, on_active = PREFAB_INSTANCE_FUNCTION_NULL, on_deactive = PREFAB_INSTANCE_FUNCTION_NULL, depthPriority = 50){
	prefab_on_create = on_create;
	prefab_on_destroy =on_destroy;
	prefab_on_active = on_active;
	prefab_on_deactive = on_deactive;
	
	if(!variable_instance_exists(id, "depth_priority"))
		depth_priority = depthPriority;
		
	if(!variable_instance_exists(id, "unique_id"))
		unique_id = uniqueId;
}

function __prefab_instance_create(prefab, is_layer, _depth, _x, _y){
	var _data = prefab_data_get(prefab);
	var _len = array_length(_data);
	var _arr_instances = array_create(_len);
	
	if(is_layer)
		for (var i = 0; i < _len; ++i) {
		   _arr_instances[i] = _data[i].__create_layer(_depth, _x, _y);
		}
	else{
		for (var i = 0; i < _len; ++i) {
		   _arr_instances[i] = _data[i].__create_depth(_depth, _x, _y);
		}
	}


	var _prefab_instance = new prefab_instance_class(_arr_instances);
	__prefab_instance_active(_prefab_instance);
	return _prefab_instance;
}

function __prefab_instance_create_at(prefab, is_layer, _depth, _x, _y){
	var _data = prefab_data_get(prefab);
	var _len = array_length(_data);
	var _arr_instances = array_create(_len);
	var _prefab_position_data = __prefab_retrieve_relative_position(prefab)
	
	if(is_layer)
		for (var i = 0; i < _len; ++i) {
		   _arr_instances[i] = _data[i].__create_layer_at(_depth, _x, _y, _prefab_position_data);
		}
	else{
		for (var i = 0; i < _len; ++i) {
		   _arr_instances[i] = _data[i].__create_depth_at(_depth, _x, _y, _prefab_position_data);
		}
	}

	var _prefab_instance = new prefab_instance_class(_arr_instances);
	__prefab_instance_active(_prefab_instance);
	return _prefab_instance;
}

function __prefab_instance_active(prefab_instance){
	var _arr = prefab_instance.instances

	if(PREFAB_INSTANCE_AUTO_IMPLEMENTS){
		for(var i = 0; i < array_length(_arr); i++){
			if(!object_is_ancestor(_arr[i].object_index, obj_prefab)){
				with(_arr[i]) prefab_instance_implemts();
			}
			_arr[i].prefab_on_create();
		}
	}
	else{
		for(var i = 0; i < array_length(_arr); i++){
			_arr[i].prefab_on_create();
		}
	}
}

function prefab_instance_create_layer(prefab, layer_id, relative_x = 0, relative_y = 0){
	return	__prefab_instance_create(prefab, true, layer_id, relative_x, relative_y);
}

function prefab_instance_create_depth(prefab, _depth = 0, relative_x = 0, relative_y = 0){ 
	return __prefab_instance_create(prefab, false, _depth, relative_x, relative_y);
}

function prefab_instance_create_layer_at(prefab, layer_id, _x, _y){
	return __prefab_instance_create_at(prefab, true, layer_id, _x, _y);
}

function prefab_instance_create_depth_at(prefab, _depth, _x, _y){
	return __prefab_instance_create_at(prefab, false, _depth, _x, _y);
}

function prefab_instance_variables_set(obj_index, array_string_variables){
	if(!is_array(array_string_variables)) array_string_variables = [array_string_variables];
	global.__prefab_instance_variables[$ object_get_name(obj_index)] = array_string_variables;
}

prefab_instance_variables_set(obj_prefab, ["depth_priority", "unique_id"]);