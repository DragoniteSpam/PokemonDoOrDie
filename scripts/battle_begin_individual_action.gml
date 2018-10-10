if (!ds_queue_empty(individual_actions)){
    var action=ds_queue_dequeue(individual_actions);
    script_execute(action.script, action.params);
    with (action){
        instance_destroy();
    }
}
