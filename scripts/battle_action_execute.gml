if (!ds_priority_empty(priority)){
    var executable=ds_priority_delete_max(priority);
    message(executable.user.name+" used action "+string(executable.action)+"["+string(executable.value)+"] on target type "+string(executable.target)+".");
}

// we don't continue automatically here; we wait for the animation to play, etc.
// and the player to press the action button
//battle_begin_round_action();
