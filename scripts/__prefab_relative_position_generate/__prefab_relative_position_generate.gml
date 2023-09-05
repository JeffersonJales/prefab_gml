function __prefab_relative_position_generate(_prefab_name){
	var _data = prefab_data_get(_prefab_name);
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
	
	return new PrefabRelativePositionClass(_median_x, _median_y, _bbox_top, _bbox_left, _bbox_right, _bbox_bottom);
}