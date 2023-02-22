/*
	PREFAB SYSTEM CONFIGURATION - OVERWRITE THIS
*/

#macro PREFAB_LAYER_NAME_PREFIX "Prefab_"				/// When using <prefab_data_add_auto> it will search for this layer name prefix to auto create prefabs for you
#macro PREFAB_INSTANCE_SAFE_CHECK true					/// When using <prefab_instance_class> methods, checks first if the instance exists before doing anything

#macro PREFAB_INSTANCE_CACHE_RELATIVE_POSITION true	/// When using <prefab_instance_create_depth_at> or <prefab_instance_create_layer_at>, it will save the center position (x,y) of the entire prefab. It will cache all the calculations results

#macro PREFAB_INSTANCE_VARIABLES_ENABLE true		///	If you want to save / load the variables of the prefab to the instance
#macro PREFAB_INSTANCE_VARIABLES_SNAPSHOT true	/// It will pick up all variables of the instance and set then. Case false, put the variables you want to save manually with <prefab_instance_variables_set>		
#macro PREFAB_INSTANCE_VARIABLES_INHERENT true	/// When using <prefab_instance_variables_set> it will check if the object have parents 
