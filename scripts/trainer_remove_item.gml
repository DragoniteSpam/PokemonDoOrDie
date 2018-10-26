/// void trainer_remove_item(DataTrainer, item index, [count]);

if (argument_count==3){
    var n=argument[2];
} else {
    var n=1;
}

var list=argument0.items[get_item(argument1).pocket];

for (var i=0; i<ds_list_size(list); i++){
    if (list[| i].index==argument1){
        list[| i].count=list[| i].count-n;
        if (list[| i].count<=0){
            instance_activate_object(list[| i]);
            with (list[| i]){
                instance_destroy();
            }
            ds_list_delete(list, i);
        }
        break;
    }
}
