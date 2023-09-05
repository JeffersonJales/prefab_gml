/// @desc 
if(room == Room1){
	prefab_data_add_auto();
	room_goto(Room2);
}
else {
	var _inst_a = prefab_instance_create_depth(0, 0, 0, "Prefab_debug_message");
	//var _inst_b = prefab_instance_create_layer(0, 0, "Instances", "Prefab_debug_message");
	var _inst_c = prefab_instance_create_depth_at(200, 50, 0, "Prefab_debug_message");
	//var _inst_d = prefab_instance_create_layer_at(60, 60, "Instances", "Prefab_button_try");

}