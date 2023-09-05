function prefab_instance_deactive(_prefab_instance){
	with(_prefab_instance){
		for(var i = 0; i < array_length(instances); i++){
			with(instances[i]){
				__prefab_local_instance_data.on_create.on_deactive();
				instance_deactivate_object(instances[i]);
			}
		}
	}
}