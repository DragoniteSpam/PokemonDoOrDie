/// DataMove add_move(name, type, category, pp, power, accuracy, priority, target, description, animation, effects, effect odds, internal name);
// there may be some move flags and stuff added later

with (instance_create(0, 0, DataMove)){
    name=argument[0];
    type=argument[1];
    category=argument[2];
    pp=argument[3];
    value=argument[4];
    accuracy=argument[5];
    priority=argument[6];
    target=argument[7];
    summary=argument[8];
    
    animation=argument[9];
    
    var array=argument[10];
    var array_odds=argument[11];
    for (var i=0; i<array_length_1d(array); i++){
        ds_list_add(effects, array[i]);
        ds_list_add(effect_odds, array_odds[i]);
    }
    
    pbs_internal_name=argument[12];
    
    return id;
}
