/// DataAbility add_ability(name, script, summary, internal name);
// there may be some move flags and stuff added later

with (instance_create(0, 0, DataAbility)){
    name=argument0;
    script=argument1;
    summary=argument2;
    
    pbs_internal_name=argument3;
    
    return id;
}
