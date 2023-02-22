global.__prefabs_relative_position_data = {};

function __prefab_retrieve_relative_position(prefab){
	if(PREFAB_INSTANCE_CACHE_RELATIVE_POSITION){
		var _data = global.__prefabs_relative_position_data[$ prefab];
		if(_data == undefined){
			_data = __prefab_relative_position_generate(prefab);
			global.__prefabs_relative_position_data[$ prefab] = _data;
		}
		return _data;
	}
	else
		return __prefab_relative_position_generate(prefab);
}

function __prefab_relative_position_generate(prefab){
	var _data = prefab_data_get(prefab);
	var _len = array_length(_data);
	var _arr_instances = array_create(_len);
	
	var _bbox_left = infinity, _bbox_right = -infinity, _bbox_top = infinity, _bbox_bottom = -infinity; 
	var _width = 0, _height = 0, _median_x = 0, _median_y = 0;
	
	for (var i = 0; i < _len; ++i) {
		_median_x += _data[i].pos_x;
		_median_y += _data[i].pos_y;
		_bbox_left = min(_median_x, _bbox_left);
		_bbox_top = min(_median_y, _bbox_top);
		_bbox_right = max(_median_x, _bbox_right);
		_bbox_bottom = max(_median_y, _bbox_bottom);
	}
	
	_median_x /= _len;
	_median_y /= _len;
	
	return new __prefab_relative_position_class(_median_x, _median_y, _bbox_top, _bbox_left, _bbox_right, _bbox_bottom);
}

function __prefab_relative_position_class(median_x, median_y, bbox_top, bbox_left, bbox_right, bbox_bottom) constructor{
	center_x = median_x;
	center_y = median_y;
	
	bbox_top = bbox_top;
	bbox_left = bbox_left;
	bbox_right = bbox_right;
	bbox_bottom = bbox_bottom;
	
	width = bbox_right - bbox_left;
	height = bbox_bottom - bbox_top;
}