/// DataMove add_move(name, type, category, pp, power, accuracy, priority, target, description, effect0, effect0odds .. effectn, effectnodds);
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
    
    for (var i=9; i<argument_count; i=i+2){
        ds_list_add(effects, argument[9+i]);
        ds_list_add(effects, argument[10+i]);
    }
    
    return id;
}
