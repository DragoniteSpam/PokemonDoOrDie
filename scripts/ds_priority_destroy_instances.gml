/// int ds_priority_destroy_instances(queue);

var n=ds_priority_size(argument0);

while (!ds_priority_empty(argument0)){
    with (ds_priority_delete_max(argument0)){
        instance_destroy();
    }
}

return n;
