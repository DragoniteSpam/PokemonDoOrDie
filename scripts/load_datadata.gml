/// void load_datadata(buffer, version);

// we want to be able to pull out the datatypes in any order, by name, and not
// be concerned with the order that they were read out
var datatype_map=ds_map_create();

var n_datadata=buffer_read(argument0, buffer_u16);
repeat (n_datadata){
    var data=instance_create(0, 0, DataData);
    
    var bools=buffer_read(argument0, buffer_u8);
    var is_enum=unpack(bools, 0);
    //var deleted=unpack(bools, 1);                                 // not useful here - just ignore later
    
    load_generic(argument0, data, argument1);
    buffer_read(argument0, buffer_string);                          // summary
    
    var n_properties=buffer_read(argument0, buffer_u16);
    repeat (n_properties){
        var name=buffer_read(argument0, buffer_string)
        buffer_read(argument0, buffer_u32);                         // flags
        buffer_read(argument0, buffer_u32);                         // guid
        
        buffer_read(argument0, buffer_u8);                          // property bools
        
        if (is_enum){
            // nothing special was saved
            ds_list_add(data.properties, array_compose(name));
        } else {
            var dtype=buffer_read(argument0, buffer_u8);
            buffer_read(argument0, buffer_f32);                     // range min
            buffer_read(argument0, buffer_f32);                     // range max
            buffer_read(argument0, buffer_u8);                      // number scale
            buffer_read(argument0, buffer_u16);                     // char limit
            buffer_read(argument0, buffer_u32);                     // type guid - the developer should already know this
            
            switch (dtype){
                case DataTypes.INT:
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
                        var btype=buffer_u8;
                        break;
            }
            
            ds_list_add(data.properties, array_compose(name, btype));
        }
    }
    
    ds_map_add(data_type_map, data.name, data);
}

Database.item_pocket=datatype_map[? "ItemPocket"];
Database.item=datatype_map[? "Item"];
Database.equipment_slot=datatype_map[? "EquipmentSlot"];
Database.element=datatype_map[? "Element"];
Database.attack=datatype_map[? "Attack"];

show_message(Database.item_pocket)
show_message(Database.item)
show_message(Database.equipment_slot)
show_message(Database.element)
show_message(Database.attack)

ds_map_destroy(datatype_map);

enum DataTypes {
    INT,
    ENUM,
    FLOAT,
    STRING,
    BOOL,
    DATA
}
