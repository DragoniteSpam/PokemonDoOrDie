/// DataAbility add_ability(name, summary, internal name);
// there may be some move flags and stuff added later

with (instance_create(0, 0, DataAbility)){
    name=argument0;
    summary=argument1;
    
    pbs_internal_name=argument2;
    
    return id;
}
