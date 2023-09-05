function prefab_instance_active(_prefab_instance){
	var _arr = _prefab_instance.instances

		for(var i = 0; i < array_length(_arr); i++){
			__prefab_local_auto_implement(_arr[i]);
			_arr[i].__prefab_local_instance_data.on_active();
		}
	}
	else{
		for(var i = 0; i < array_length(_arr); i++){
			_arr[i].__prefab_local_instance_data.on_active();
		}
	}
}