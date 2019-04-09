/// void load_data_instances(buffer, version);

var version=argument1;

var n_datadata=array_length_1d(Database.data_type_array);
var all_blobs=array_create(n_datadata);

for (var i=0; i<n_datadata; i++){
    var datadata=Database.data_type_array[i];
    
    if (datadata.is_enum){
        // enums don't get instantiated
    } else {
        var n_properties=array_length_1d(datadata.properties);
        var n_instances=buffer_read(argument0, buffer_u16);
        datadata.instances=array_create(n_instances);
        
        var blob_array;
        blob_array[n_instances, n_properties]=0;
        
        for (var j=0; j<n_instances; j++){
            var name=buffer_read(argument0, buffer_string)
            var flags=buffer_read(argument0, buffer_u32);
            var guid=buffer_read(argument0, buffer_u32);
            
            for (var k=0; k<n_properties; k++){
                // [name, guid, data type]
                var property=datadata.properties[k];
                blob_array[j, k]=buffer_read(argument0, property[2]);
            }
        }
        
        all_blobs[i]=blob_array;
    }
}

load_data_parse_items(all_blobs);
