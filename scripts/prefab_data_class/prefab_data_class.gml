
/// @param {Instance.Id} instance The instance to extract the prefab information
function __prefab_data_class(instance) constructor {
	
	pos_x = instance.x;
	pos_y = instance.y;
	angle = instance.image_angle;
	color = instance.image_blend;
	xscale = instance.image_xscale;
	yscale = instance.image_yscale;
	img_speed = instance.image_speed;
	img_frame = instance.image_index;
	obj_index = instance.object_index;

	variables = {};
	
	var _set_variables = function(obj = obj_index, instance){
		var _names = global.__prefab_instance_variables[$ object_get_name(obj)];
		if(_names != undefined){
			for (var i = 0; i < array_length(_names); ++i) {
				variable_struct_set(variables, _names[i], variable_instance_get(instance, _names[i]));
			}
		}
	}
	
	if(PREFAB_INSTANCE_VARIABLES_ENABLE){
		if(PREFAB_INSTANCE_VARIABLES_SNAPSHOT){
			var _names = variable_instance_get_names(instance);
			for(var i = 0; i < array_length(_names); i++){
				variable_struct_set(variables, _names[i], variable_instance_get(instance, _names[i]));
			}
		}
		else {
			_set_variables(obj_index, instance);
			if(PREFAB_INSTANCE_VARIABLES_INHERENT){
				var _parent = object_get_parent(obj_index);
				with(_parent != PREFAB_INSTANCE_WITHOUT_PARENT){
					_set_variables(_parent, instance);
					_parent = object_get_parent(_parent);
				}
			}
		}
	}
	
	static __create_struct_data = function(){
		var _struct = {
			image_xscale : xscale, 
			image_yscale : yscale,
			image_angle : angle,
			image_blend : color, 
			image_speed : img_speed,
			image_index : img_frame
		}
		
		if(PREFAB_INSTANCE_VARIABLES_ENABLE){
			var _names = variable_struct_get_names(variables);
			for(var i = 0; i < array_length(_names); i++){
				variable_struct_set(_struct, _names[i], variables[$ _names[i]]);
			}
		}
		
		return _struct;
	}
	
	static __create_layer = function(layer_id, _x, _y){
		var _inst = instance_create_layer(pos_x + _x, pos_y + _y, layer_id, obj_index, __create_struct_data());
		_inst.prefab_on_create();
		return _inst 
	}
	
	static __create_depth = function(_depth, _x, _y){
		var _inst =	instance_create_depth(pos_x + _x, pos_y + _y, _depth, obj_index, __create_struct_data());
		_inst.prefab_on_create();
		return _inst 
	}
	
	static __create_depth_at = function(_depth, _x, _y, _prefab_position_data){
		var _dir = point_direction(pos_x, pos_y, _prefab_position_data.center_x, _prefab_position_data.center_y);
		var _dist = point_distance(pos_x, pos_y, _prefab_position_data.center_x, _prefab_position_data.center_y)
		_x = _x - lengthdir_x(_dist, _dir); 
		_y = _y - lengthdir_y(_dist, _dir);
		
		var _inst =	instance_create_depth(_x, _y, _depth, obj_index, __create_struct_data());
		_inst.prefab_on_create();
		return _inst 
	}
	
	static __create_layer_at = function(layer_id, _x, _y, _prefab_position_data){
		var _dir = point_direction(pos_x, pos_y, _prefab_position_data.center_x, _prefab_position_data.center_y);
		var _dist = point_distance(pos_x, pos_y, _prefab_position_data.center_x, _prefab_position_data.center_y)
		_x = _x - lengthdir_x(_dist, _dir); 
		_y = _y - lengthdir_y(_dist, _dir);
		
		var _inst =	instance_create_layer(_x, _y, layer_id, obj_index, __create_struct_data());
		_inst.prefab_on_create();
		return _inst 
	}
	
}