function prefab_instance_create_layer_at(_x, _y, _layer_id, _prefab_name){
	var _data = prefab_data_get(_prefab_name);
	var _prefab_position_data = prefab_relative_position_get(_prefab_name)
	
	var _len = array_length(_data);
	var _arr_instances = array_create(_len);
	
	
	for(var i = 0; i < _len; i++){
		var _info_prefab_local_inst = _data[i];
		
		var _dir = point_direction(_info_prefab_local_inst.pos_x, _info_prefab_local_inst.pos_y, _prefab_position_data.center_x, _prefab_position_data.center_y);
		var _dist = point_distance(_info_prefab_local_inst.pos_x, _info_prefab_local_inst.pos_y, _prefab_position_data.center_x, _prefab_position_data.center_y);
		var _pos_x = _x - lengthdir_x(_dist, _dir); 
		var _pos_y = _y - lengthdir_y(_dist, _dir);
		
		_arr_instances[i] =	instance_create_layer(
			_pos_x, _pos_y, _layer_id, 
			_info_prefab_local_inst.obj_index, 
			__prefab_data_generate_struct(_info_prefab_local_inst)
		);
		_arr_instances[i].__prefab_local_instance_data.on_create();
	}
	
	var _prefab_instance = new PrefabInstanceClass(_arr_instances);
	prefab_instance_active(_prefab_instance);
	return _prefab_instance;
}