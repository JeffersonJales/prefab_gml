/*
	PREFAB SYSTEM CONFIGURATION - OVERWRITE THIS, IN CASE YOU NEED
*/

#macro PREFAB_INSTANCE_LAYER_NAME_PREFIX "Prefab_"			/// When using <prefab_data_add_auto> it will search for this layer name prefix to auto create prefabs for you

/// It will make everything more automated, but will use more storage from more resources to work
#macro PREFAB_INSTANCE_AUTO_IMPLEMENTS false				/// Case you're using objects that are NOT a children of the obj_prefab, its can setup this too you
#macro PREFAB_INSTANCE_VARIABLES_SNAPSHOT_PREFIX "__pref_"  /// Case the object / instance have this variables prefix, it will be saved too

/// Will use a litte more of you RAM but it also store some math results
#macro PREFAB_INSTANCE_CACHE_RELATIVE_POSITION true	/// When using <prefab_instance_create_depth_at> or <prefab_instance_create_layer_at>, it will save the center position (x,y) of the entire prefab. It will cache all the calculations results
