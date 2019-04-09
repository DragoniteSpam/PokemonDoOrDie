/// void load_data_parse_items(all blobs);
// this could be done in load_data_instances, and it would probably
// be way more straightforward that way, but i draw the line at script
// hugeness somewhere around there

var property_map=load_data_parse_properties(Database.data_type_array[Database.item]);

var blob=argument0[Database.item];
var n_items=ds_grid_width(blob);

Database.all_items=array_create(n_items);
for (var i=0; i<n_items; i++){
    var item=add_item(blob[# i, 0],
        blob[# i, 0],                           // plural
        blob[# i, property_map[? "Pocket"]],
        blob[# i, property_map[? "Price"]],
        null,                                   // overworld use script
        null,                                   // battle use script
        null,                                   // special use script
        blob[# i, property_map[? "Power"]],
        ItemAIFlags.NONE,                       // AI flags
        blob[# i, property_map[? "Summary"]],
        blob[# i, 0]);
    
    item.flags=blob[# i, 1];
    guid_set(item, blob[# i, 2]);
    Database.all_items[i]=item;
}

ds_grid_destroy(blob);
ds_map_destroy(property_map);
