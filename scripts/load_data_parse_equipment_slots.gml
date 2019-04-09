/// void load_data_parse_equipment_slots(all blobs);

var property_map=load_data_parse_properties(Database.data_type_array[Database.equipment_slot]);

var blob=argument0[Database.equipment_slot];
var n_instances=ds_grid_width(blob);

Database.all_equipment_slots=array_create(n_instances);
for (var i=0; i<n_instances; i++){
    var data=add_equipment_slot(blob[# i, 0],
    );
    
    data.flags=blob[# i, 1];
    guid_set(data, blob[# i, 2]);
    Database.all_equipment_slots[i]=data;
}

ds_grid_destroy(blob);
ds_map_destroy(property_map);
