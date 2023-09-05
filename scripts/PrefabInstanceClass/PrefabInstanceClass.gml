
/// @param {Array.Instance.Id} array_instances	An array with instances id.
function PrefabInstanceClass(array_instances) constructor {
	instances = array_instances;
	instances_by_id = {}
	
	for(var i = 0; i < array_length(array_instances); i++){
		instances_by_id[$ array_instances[i].__pref_id] = array_instances[i];
	}
}