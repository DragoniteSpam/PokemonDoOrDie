/// void load_data_parse_weapon_types(all blobs);

var property_map=load_data_parse_properties(Database.data_type_array[Database.weapon_type]);

var blob=argument0[Database.weapon_type];
var n_instances=ds_grid_width(blob);

Database.all_weapon_types=array_create(n_instances);
for (var i=0; i<n_instances; i++){
    var data=instance_create(0, 0, DataWeaponType);
    
    data.name=blob[# i, 0];
    data.flags=blob[# i, 1];
    guid_set(data, blob[# i, 2]);
    
    Database.all_weapon_types[i]=data;
}

ds_grid_destroy(blob);
ds_map_destroy(property_map);
