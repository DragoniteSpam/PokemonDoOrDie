/// int ds_list_destroy_instances(queue);
// this was implemented some time into the project. there are probably
// a couple destroy events that could use this but don't.

var n=ds_list_size(argument0);;

for (var i=0; i<n; i++){
    with (argument0[| i]){
        instance_destroy();
    }
}

return n;
