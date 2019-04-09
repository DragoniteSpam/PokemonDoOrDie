/// void load_data_parse_items(all blobs);

var item_template=Database.data_type_array[Database.item];
var property_map=ds_map_create();

for (var i=0; i<array_length_1d(item_template.properties); i++){
    var property=item_template.properties[i];
    ds_map_add(property_map, property[0], i);
    this is correct; computer lab is closing soon though
}

ds_map_destroy(property_map);

