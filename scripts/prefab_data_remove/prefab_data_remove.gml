function prefab_data_remove(_prefab_name){
	var _data = global.__prefabs_data[$ _prefab_name];
	if(_data != undefined) variable_struct_remove(global.__prefabs_data, _prefab_name);

	var _cache = global.__prefabs_relative_position_data[$ _prefab_name];
	if(_cache != undefined) variable_struct_remove(global.__prefabs_relative_position_data, _prefab_name); 
}