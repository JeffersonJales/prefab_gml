
/// @param {Array.Instance.Id} array_instances	An array with instances id.
function prefab_instance_class(array_instances) constructor {
	instances = array_instances;
	
	static active = function(){
		for(var i = 0; i < array_length(instances); i++){
			instance_activate_object(instances[i]);
			instances[i].prefab_on_active();
		}
	}
	
	static deactive = function(){
		for(var i = 0; i < array_length(instances); i++){
			if(__safe_check(i)){
				instances[i].prefab_on_deactive();
				instance_deactivate_object(instances[i]);
			}
		}
	}

	static set_depth_y = function(){
		for (var i = 0; i < array_length(instances); ++i) {
			with(instances[i]) depth = -y;
		}
	}
		
	static destroy = function(){
		for(var i = 0; i < array_length(instances); i++){
			if(__safe_check(i)){
				instances[i].prefab_on_destroy();
				instance_destroy(instances[i]);
			}
		}
	}

	static __safe_check = function(inst_position = 0){
		return !(PREFAB_INSTANCE_SAFE_CHECK && !instance_exists(instances[inst_position]));
	}
}