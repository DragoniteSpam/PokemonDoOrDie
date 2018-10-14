/// DataTrainer add_trainer(name, class, version, items, party);

with (instance_create(0, 0, DataTrainer)){
    name=argument[0];
    class=argument[1];
    version=argument[2];
    
    var item_array=argument[3];
    for (var i=0; i<array_length_1d(item_array); i++){
        ds_list_add(items, item_array[i]);
    }
    
    var party_array=argument[4];
    for (var i=0; i<array_length_1d(party_array); i++){
        ds_list_add(party, party_array[i]);
    }
    
    return id;
}
