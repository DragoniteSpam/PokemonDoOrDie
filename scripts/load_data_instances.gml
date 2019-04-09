/// void load_data_instances(buffer, version);

var n_datadata=array_length_1d(Database.data_type_array);

for (var i=0; i<n_datadata; i++){
    var datadata=Database.data_type_array[i];
    
    if (datadata.is_enum){
        // enums don't get instantiated
    } else {
        var n_properties=array_length_1d(datadata.properties);
        var n_instances=buffer_read(argument0, buffer_u16);
        datadata.instances=array_create(n_instances);
        
        var blob=ds_map_create();
        var types=array_create(n_properties);
        
        for (var j=0; j<n_properties; j++){
            var property_data=datadata.properties[j];
            types[j]=property_data;
        }
        
        for (var j=0; j<n_instances; j++){
            var name=buffer_read(argument0, buffer_string)
            var flags=buffer_read(argument0, buffer_u32);
            var guid=buffer_read(argument0, buffer_u32);
            
            load_data_instance_blob(argument0, argument1, blob, types);
        }
        
        ds_map_destroy(blob);
    }
}

/// void serialize_load_data_instances(buffer, version);

/*        for (var j=0; j<n_instances; j++){
            var instance=instance_create(0, 0, DataInstantiated);
            ds_list_add(datadata.instances, instance);
            
            load_generic(argument0, instance, version);
            
            for (var k=0; k<n_properties; k++){
                var property=datadata.properties[| k];
                switch (property.type){
                    case DataTypes.INT:
                        // constraining this to the range allowed by the property (u8, s8,
                        // s16, etc) sounds fun but probably not worth the time
                        var btype=buffer_s32;
                        break;
                    case DataTypes.ENUM:
                    case DataTypes.DATA:
                        var btype=buffer_u32;
                        break;
                    case DataTypes.FLOAT:
                        var btype=buffer_f32;
                        break;
                    case DataTypes.STRING:
                        var btype=buffer_string;
                        break;
                    case DataTypes.BOOL:
                        // could pack these but the savings are honestly just not
                        // significant enough for me to dedicate time to this if it's
                        // not as simple as just using pack/unpack
                        var btype=buffer_u8;
                        break;
                }
                ds_list_add(instance.values, buffer_read(argument0, btype));
            }
        }
    }
}

instance_deactivate_object(DataInstantiated);
