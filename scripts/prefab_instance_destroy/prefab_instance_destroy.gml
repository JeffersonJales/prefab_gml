function prefab_instance_destroy(_prefab_instance){
	with(_prefab_instance){
		for(var i = 0; i < array_length(instances); i++){
			with(instances[i]){
				__prefab_local_instance_data.on_destroy();
				instance_destroy(instances[i]);
			}
		}
	}
}