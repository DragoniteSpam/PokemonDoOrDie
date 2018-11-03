/// DataItem add_item(name, plural, pocket, price, overworld, battle, spcial, value, ai flags, summary, internal name);

// todo when it comes time to ACTUALLY load items from
// a file, it may be a good idea to something similar
// to what i suggested in the comment in add_ability
with (instance_create(0, 0, DataItem)){
    name=argument0;
    plural=argument1;
    pocket=argument2;
    price=argument3;
    overworld=argument4;
    battle=argument5;
    special=argument6;
    
    value=argument7;
    
    ai_flags=argument8;
    
    summary=argument9;
    pbs_internal_name=argument10;
    
    return id;
}
