# prefab_gml
Prefabs for GameMaker (LTS+)

# How it works?
Probably will create a video to explain the setup.

# Function Index
## Prefab Data
- prefab_data_add - Adds a prefab from the given layer. The prefab name will be also the layer name 
- prefab_data_add_auto - Check every layer on the room, will try to transform them into prefabs
- prefab_data_remove - Removes a prefab by it's name
- prefab_data_exists - Check if the prefab exists by it's name
- prefab_data_get - Get the prefab data by it's name

## Prefab Local 
- prefab_local_init - Put this on Ojbect Create Event Or Instance Creation Code. It will be necessary to init this object prefab stuff. 

## Prefab Instance
- prefab_instance_create_depth - Creates a prefab. Its position is based on indiviual position of the instances that compose the prefab.
- prefab_instance_create_layer - Creates a prefab. Its position is based on indiviual position of the instances that compose the prefab.
- prefab_instance_create_depth_at - Creates a prefab instance. Its position is based on the center position of the prefab.
- prefab_instance_create_layer_at - Creates a prefab instance. Its position is based on the center position of the prefab.

- prefab_instance_active - Actives the prefab instance.
- prefab_instance_deactive - Deactive a prefab instance.
- prefab_instance_destroy - Destroy a prefab instance.
- prefab_instance_get_instance_by_id - Get a instance that compose the prefab instance.

## Prefab Relative Position
- prefab_relative_position_get - Get the relative position of the prefab
- prefab_relative_position_cache_clear - Clear all relative position cache

## Config Macros
- PREFAB_INSTANCE_LAYER_NAME_PREFIX - STRING - The layer name prefix to auto add this layer as prefab.
- PREFAB_INSTANCE_CACHE_RELATIVE_POSITION - BOOLEAN - If can cache the relative position of the prefab.
- PREFAB_INSTANCE_AUTO_IMPLEMENTS - BOOLEAN - Case you dont add the <prefab_local_init> to the object or instance. It will populate for you, but some functions will dont work properly
- PREFAB_INSTANCE_VARIABLES_SNAPSHOT_PREFIX - STRING - If the object / instance have a variable with this prefix, this variable will be saved in the prefab. Init this variables on Object Variables or Instance Creation Code
