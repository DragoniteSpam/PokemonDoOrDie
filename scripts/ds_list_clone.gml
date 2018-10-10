/// list ds_list_clone(list);

var list=ds_list_create();

for (var i=0; i<ds_list_size(argument0); i++){
    ds_list_add(list, argument0[| i]);
}

return list;
