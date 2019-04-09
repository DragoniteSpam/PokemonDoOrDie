/// void load_data_parse_item_pockets(all blobs);

var property_map=load_data_parse_properties(Database.data_type_array[Database.item_pocket]);

var blob=argument0[Database.item_pocket];
var n_instances=ds_grid_width(blob);

Database.all_item_pockets=array_create(n_instances);
for (var i=0; i<n_instances; i++){
    var data=add_item_pocket(blob[# i, 0],
        c_yellow,                               // color
        -1,                                     // icon
        -1                                      // spound effect
    );
    
    data.flags=blob[# i, 1];
    guid_set(data, blob[# i, 2]);
    Database.all_item_pockets[i]=data;
}

ds_grid_destroy(blob);
ds_map_destroy(property_map);
