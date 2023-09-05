function __prefab_local_auto_implement(_inst){
	if(!variable_instance_exists(_inst, "__prefab_local_instance_data"))
		with(_inst) prefab_local_init(object_get_name(object_index) + string(id), depth);
}