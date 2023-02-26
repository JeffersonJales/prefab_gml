/*
	PREFAB SYSTEM CONFIGURATION - OVERWRITE THIS, IN CASE YOU NEED
*/

#macro PREFAB_LAYER_NAME_PREFIX "Prefab_"				/// When using <prefab_data_add_auto> it will search for this layer name prefix to auto create prefabs for you
#macro PREFAB_DATA_OVERWRITE_ENABLE false				/// When adding a prefab data, case already exists, will check if can overwrite data

#macro PREFAB_INSTANCE_SAFE_CHECK true					/// When using <prefab_instance_class> methods, checks first if the instance exists before doing anything
#macro PREFAB_INSTANCE_VARIABLES_ENABLE true		///	If you want to save / load the variables of the prefab to the instance
#macro PREFAB_INSTANCE_VARIABLES_INHERENT true	/// When using <prefab_instance_variables_set> it will check if the object have parents 

/// It will make everything more automated, but will use more storage from more resources to work
#macro PREFAB_INSTANCE_AUTO_IMPLEMENTS false			/// Case you're using objects that are NOT chield of the obj_prefab, its can setup this too you
#macro PREFAB_INSTANCE_VARIABLES_SNAPSHOT false		/// It will pick up all variables of the instance and set then. Case false, put the variables you want to save manually with <prefab_instance_variables_set>		

/// Will use a litte more of you RAM but it also store some math results
#macro PREFAB_INSTANCE_CACHE_RELATIVE_POSITION true	/// When using <prefab_instance_create_depth_at> or <prefab_instance_create_layer_at>, it will save the center position (x,y) of the entire prefab. It will cache all the calculations results
