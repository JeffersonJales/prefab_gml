// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PrefabRelativePositionClass(_median_x, _median_y, _bbox_top, _bbox_left, _bbox_right, _bbox_bottom) constructor{
	center_x = _median_x;
	center_y = _median_y;
	
	bbox_top = _bbox_top;
	bbox_left = _bbox_left;
	bbox_right = _bbox_right;
	bbox_bottom = _bbox_bottom;
	
	width = _bbox_right - _bbox_left;
	height = _bbox_bottom - _bbox_top;
}