/// DataItem add_item(name, plural, pocket, price, overworld, battle, spcial, value, summary, internal name);

with (instance_create(0, 0, DataItem)){
    name=argument0;
    plural=argument1;
    pocket=argument2;
    price=argument3;
    overworld=argument4;
    battle=argument5;
    special=argument6;
    
    value=argument7;
    
    summary=argument8;
    pbs_internal_name=argument9;
    
    return id;
}
