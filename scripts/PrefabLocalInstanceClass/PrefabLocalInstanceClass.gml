function PrefabLocalInstanceClass(_id, _depth, _on_create = 0, _on_destroy = 0, _on_active = 0, _on_deactive = 0) constructor{
	local_id = _id;
	depth_order = _depth;
	
	on_create = _on_create;
	on_destroy = _on_destroy;
	
	on_active = _on_active;
	on_deactive = _on_deactive;
}