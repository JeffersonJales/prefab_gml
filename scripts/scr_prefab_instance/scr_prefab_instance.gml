
#macro PREFAB_INSTANCE_WITHOUT_PARENT -100
global.__prefab_instance_variables = {}			/// Will hold an array with strings (variables names / pointers)

function prefab_instance_implemts(){
	prefab_on_create = function(){};
	prefab_on_destroy = function(){};
	prefab_on_active = function(){}
	prefab_on_deactive = function(){}
	
	if(!variable_instance_exists(id, "depth_priority"))
		depth_priority = 50;
		
	if(!variable_instance_exists(id, "unique_id"))
		unique_id = "my_id";
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

	return new prefab_instance_class(_arr_instances);
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

	return new prefab_instance_class(_arr_instances);
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