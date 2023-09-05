function prefab_relative_position_get(_prefab_name){
	if(PREFAB_INSTANCE_CACHE_RELATIVE_POSITION){
		var _data = global.__prefabs_relative_position_data[$ _prefab_name];
		if(_data == undefined){
			_data = __prefab_relative_position_generate(_prefab_name);
			global.__prefabs_relative_position_data[$ _prefab_name] = _data;
		}
		return _data;
	}
	else
		return __prefab_relative_position_generate(_prefab_name);
}