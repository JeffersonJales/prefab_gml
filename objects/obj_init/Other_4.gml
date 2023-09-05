/// @desc 
if(room == Room1){
	prefab_data_add_auto();
	room_goto(Room2);
}
else {
	prefab_instance_create_layer("Instances", "Prefab_debug_message");
	prefab_instance_create_layer("Instances", "Prefab_button_try");
}